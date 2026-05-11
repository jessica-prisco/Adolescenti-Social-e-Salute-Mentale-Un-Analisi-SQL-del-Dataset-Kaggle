## 🧠 Query SQL principali

### 🔹 1. Visualizzazione del dataset
```sql
SELECT * 
FROM Teen_Mental_Health_Dataset;

### 🔹 2. Stress medio per genere
SELECT gender, AVG(stress_level)
FROM Teen_Mental_Health_Dataset
GROUP BY gender;

### 🔹 3. Screen time, ansia e depressione per età e genere
SELECT 
    age,
    gender,
    AVG(screen_time_before_sleep),
    AVG(anxiety_level),
    AVG(depression_label)
FROM Teen_Mental_Health_Dataset
GROUP BY age, gender
ORDER BY age, gender;

### 🔹 4. Ansia e interazione sociale per fasce d’età
SELECT
    CASE 
        WHEN age BETWEEN 13 AND 15 THEN '13-15'
        WHEN age BETWEEN 16 AND 17 THEN '16-17'
        WHEN age BETWEEN 18 AND 19 THEN '18-19'
    END AS age_group,
    gender,
    AVG(anxiety_level),
    AVG(
        CASE 
            WHEN social_interaction_level = 'high' THEN 3
            WHEN social_interaction_level = 'medium' THEN 2
            WHEN social_interaction_level = 'low' THEN 1
        END
    ) AS avg_social_interaction
FROM Teen_Mental_Health_Dataset
GROUP BY age_group, gender
ORDER BY age_group, gender;

### 🔹 5. Attività fisica e dipendenze
SELECT 
    age,
    gender,
    CEILING(AVG(physical_activity)),
    CEILING(AVG(addiction_level)),
    COUNT(*)
FROM Teen_Mental_Health_Dataset
GROUP BY age, gender
ORDER BY age, gender;

### 🔹 6. Social media più usato e media scolastica

WITH base AS (
    SELECT
        CASE 
            WHEN age BETWEEN 13 AND 15 THEN '13-15'
            WHEN age BETWEEN 16 AND 17 THEN '16-17'
            WHEN age BETWEEN 18 AND 19 THEN '18-19'
        END AS age_group,
        gender,
        academic_performance,
        platform_usage
    FROM Teen_Mental_Health_Dataset
    WHERE platform_usage IN ('TikTok', 'Instagram')
),
platform_counts AS (
    SELECT
        age_group,
        gender,
        platform_usage,
        COUNT(*) AS usage_count,
        ROW_NUMBER() OVER (
            PARTITION BY age_group, gender
            ORDER BY COUNT(*) DESC, platform_usage ASC
        ) AS rn
    FROM base
    GROUP BY age_group, gender, platform_usage
)
SELECT
    b.age_group,
    b.gender,
    AVG(b.academic_performance) AS avg_academic_performance,
    pc.platform_usage AS most_used_platform,
    CASE 
        WHEN pc.platform_usage = 'TikTok' THEN 1
        WHEN pc.platform_usage = 'Instagram' THEN 2
    END AS platform_as_number
FROM base b
JOIN platform_counts pc
    ON b.age_group = pc.age_group
    AND b.gender = pc.gender
    AND pc.rn = 1
GROUP BY b.age_group, b.gender, pc.platform_usage
ORDER BY b.age_group, b.gender;
