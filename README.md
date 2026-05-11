# Adolescenti-Social-e-Salute-Mentale-Un-Analisi-SQL-del-Dataset-Kaggle
Analisi dei fattori che influenzano la salute mentale degli adolescenti attraverso SQL, grafici e interpretazioni basate sul dataset Kaggle *Teen Mental Health*.

---

## 📌 Introduzione
Questo progetto analizza il dataset [Teen Mental Health](https://www.kaggle.com/datasets/algozee/teenager-menthal-healy) disponibile su Kaggle, con l’obiettivo di comprendere come **stress, ansia, depressione, attività fisica, dipendenze e uso dei social media** influenzino il benessere degli adolescenti.

L’intera analisi è stata svolta tramite **SQL**, con visualizzazioni grafiche e interpretazioni finali.

---

## 🎯 Obiettivi del progetto
- Analizzare i principali indicatori di salute mentale negli adolescenti.
- Individuare differenze significative tra **genere** e **fasce d’età**.
- Esplorare la relazione tra **uso dei social media** e **performance scolastica**.
- Valutare l’impatto di abitudini quotidiane (screen time, attività fisica, interazione sociale).

---

## 📁 Struttura del progetto

### 📄 1. README.md
Documento principale che descrive il progetto, le analisi e i risultati.
---

### 📂 2. sql/
Include tutte le query SQL utilizzate per l’analisi.

- `01_visualizzazione_dataset.sql` — visualizzazione completa del dataset  
- `02_stress_per_genere.sql` — media dello stress per genere  
- `03_screen_ansia_depressione.sql` — screen time, ansia e depressione per età e genere  
- `04_ansia_interazione_sociale.sql` — ansia e interazione sociale per fasce d’età  
- `05_attivita_fisica_dipendenze.sql` — attività fisica e livelli di dipendenza  
- `06_social_media_vs_performance.sql` — social più usato e media scolastica

---

### 📂 3. graphs/
Raccolta dei grafici generati a partire dalle query SQL.
- `stress_gender.png`
- `depression_age_gender.png`
- `anxiety_social_interaction.png`
- `physical_activity_age_gender.png`
- `addiction_age_gender.png`
- `academic_vs_social.png`
- `screen_time_vs_anxiety.png`

---

### 📂 4. analysis/
Contiene le interpretazioni dei grafici e le conclusioni finali.
- `interpretazione_stress.md`
- `interpretazione_depressione.md`
- `interpretazione_ansia_interazione.md`
- `interpretazione_attivita_dipendenze.md`
- `interpretazione_social_vs_scuola.md`
- `conclusioni_generali.md`

---




