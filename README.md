# ⚽ FIFA World Cup Data Analysis (1930–2014)

This project analyzes **FIFA World Cup match data (1930–2014)** to uncover hidden patterns in scoring trends, team performance, and tournament evolution — using only **R101-approved statistical functions**.  
The goal is to provide counter-intuitive insights for **data journalism** and football analytics.

---

## 📊 Project Overview
- **Comprehensive Data Exploration** – 852 complete World Cup matches across 84 years  
- **Scoring Trend Analysis** – evolution of goals per match from the 1930s to the modern era  
- **Team Dominance Study** – nations with the most World Cup match appearances  
- **Era Comparison** – scoring patterns across different football periods  
- **Objective** – reveal surprising insights into World Cup history  

---

## 📂 Dataset
The dataset contains match-level information from FIFA World Cups:

| Feature            | Description                                         |
|--------------------|-----------------------------------------------------|
| `Year`             | Tournament year                                     |
| `Home.Team.Name`   | Home team in the match                              |
| `Away.Team.Name`   | Away team in the match                              |
| `Home.Team.Goals`  | Goals scored by home team                           |
| `Away.Team.Goals`  | Goals scored by away team                           |
| `Stage`            | Tournament stage (Group, Quarter-final, Final, etc.)|
| `Total.Goals`      | Combined goals in the match                         |
| `Score_Category`   | Scoring level (Low, Medium, High, Very High)        |

---

## 🛠 Key Techniques
### Data Exploration & Cleaning
- Filtered missing values (`subset()`)
- Statistical summaries of scoring trends
- Era-based segmentation for analysis
- Frequency counts of team appearances  

### Feature Engineering
- **`Total.Goals`** = Home + Away  
- Era categorization using `subset()`:
  - Very Early Era (1930–1950)  
  - Early Era (1950–1970)  
  - Middle Era (1970–1990)  
  - Recent Era (1990+)  
- Scoring classification via `cut()`  
- Combined team appearance counts  

### Statistical Analysis
- Time series trends with `tapply()`  
- Comparative analysis between eras  
- Team dominance via appearance frequency  
- Goal distributions by stage  

### Visualization
- **Bar plots** – goals per World Cup year  
- **Line plots** – scoring evolution over time  
- **Distributions** – scoring categories  
- **Bar plots** – team appearance frequencies  

---

## 🔑 Key Findings
- **Scoring Evolution**
  - 1954: **5.38 goals/match** (highest in history)  
  - Very Early Era (1930–1950): 4.16 goals/match  
  - Modern Era (1990+): 2.50 goals/match  
  - Overall: ~40% decline in goals over time  

- **Team Dominance**
  - Brazil: 108 appearances  
  - Argentina: 81 appearances  
  - Germany: 48 appearances  

- **Match Distribution**
  - Medium scoring (2–3 goals): **41.5%**  
  - Low scoring (0–1 goals): 27.3%  
  - High scoring (4–5 goals): 22.4%  
  - Very high scoring (6+ goals): 8.7%  

---

## 📘 R101 Functions Used
- **Data Handling**: `read.csv()`, `subset()`, `unique()`, `head()`, `summary()`, `colnames()`  
- **Statistics**: `table()`, `tapply()`, `mean()`, `min()`, `max()`, `cut()`  
- **Visualization**: `barplot()`, `plot()`  

---

## ⚡ Technical Challenges Solved
- **Missing Data** – 3,720 missing values handled via `subset()` filtering  
- **Function Restrictions** – avoided `sort()`, `which.max()`, `paste()`, etc.  
- **Team Appearances** – combined home/away subsets for totals  

---

## 📰 Data Journalism Headlines
- **Main:** *“The 1954 World Cup Secret FIFA Doesn’t Want You to Know — This One Number Changes Everything!”*  
- **Alternatives:**  
  - “Brazil’s Hidden World Cup Dominance Has Nothing to Do With Winning”  
  - “Why Modern Football Fans Are Being Robbed of Goals (The Data Doesn’t Lie)”  

---

## 📦 Requirements
- R programming environment  
- Dataset: `WorldCupMatches.csv` from [Kaggle](https://www.kaggle.com/datasets)  
- Only **R101-approved functions**  

---

## ▶️ How to Use
1. Download `WorldCupMatches.csv` from Kaggle  
2. Place the CSV file in your R working directory  
3. Run `fifa_worldcup_analysis.R`  
4. Review generated plots & outputs  
5. Use insights for journalism or analytics  

---

## 📁 File Structure

- `fifa_worldcup_analysis.R` — Main analysis script  
- `WorldCupMatches.csv` — Source dataset (from Kaggle)  
- `MyWork_documentation.pdf` — Methodology & findings  
- `FIFA_WorldCup_Article.pdf` — Data journalism article  
- `README.md` — Project documentation  

---

## 💡 Applications
- **FIFA / Organizers** – insights into how formats affect goal scoring  
- **Media / Broadcasters** – narratives challenging modern football myths  
- **Football Analytics** – quantitative evidence of tactical evolution  
- **Data Journalism** – counter-intuitive stories backed by statistics  

---

## 📊 Statistical Summary
- **Matches analyzed:** 852 complete records  
- **Time period:** 1930–2014 (84 years)  
- **Countries represented:** 50+  
- **Peak tournament:** 1954 (5.38 goals/match)  
- **Overall average:** 2.83 goals/match  
- **Most active team:** Brazil (108 appearances)  

---

