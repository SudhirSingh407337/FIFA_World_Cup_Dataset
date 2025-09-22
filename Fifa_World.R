# FIFA World Cup Data Analysis

# Load the dataset
# WorldCupMatches.csv from https:https://www.kaggle.com/datasets/abecklas/fifa-world-cup/data


worldcup_matches <- read.csv("WorldCupMatches.csv")

# Initial exploration by the first 5 rows, summary, column names, numbers of rows, and unique years
print("First 5 rows of the dataset:")
head(worldcup_matches)

print("Summary of the dataset:")
summary(worldcup_matches)

print("Column names:")
colnames(worldcup_matches)

print("Number of rows (total matches):")
nrow(worldcup_matches)

# Finds the unique years to understand coverage
print("Unique World Cup years in dataset:")
unique(worldcup_matches$Year)

# ==================== PATTERN 1 EXPLORATION ====================
# Pattern 1: Goals per match evolution over time

# This creates a total goals column
worldcup_matches$Total.Goals <- worldcup_matches$Home.Team.Goals + worldcup_matches$Away.Team.Goals

# This line of code filter out rows where goals data exists using subset to remove the NA values
worldcup_clean <- subset(worldcup_matches, Home.Team.Goals >= 0 & Away.Team.Goals >= 0)

print("Basic statistics for goals per match:")
mean(worldcup_clean$Total.Goals)
max(worldcup_clean$Total.Goals)
min(worldcup_clean$Total.Goals)

# This is to find the goals by year analysis using tapply
goals_by_year <- tapply(worldcup_clean$Total.Goals, worldcup_clean$Year, mean)
print("Average goals per match by World Cup year:")
goals_by_year

# Create bar plot of goals by year
barplot(goals_by_year, 
        main = "Average Goals Per Match by World Cup Year",
        xlab = "World Cup Year",
        ylab = "Average Goals per Match", 
        col = "darkblue",
        las = 2)

# ==================== PATTERN 2 EXPLORATION ====================
# Pattern 2: Team dominance - which teams appear most often

# This block of code counts and prints the home team appearances
home_teams <- table(worldcup_clean$Home.Team.Name)
print("Home team appearances:")
home_teams

# Prints the Count away team appearances  
away_teams <- table(worldcup_clean$Away.Team.Name)
print("Away team appearances:")
away_teams

# Create bar plot for home team appearances in the Word Cup History
barplot(home_teams,
        main = "Home Team Appearances in World Cup History", 
        xlab = "Team",
        ylab = "Number of Home Matches",
        col = "red",
        las = 2,
        cex.names = 0.8)

# ==================== PATTERN 3 EXPLORATION ====================
# Pattern 3: Team dominance analysis

# Look at powerhouse teams in FIFA History which is usually Brazil, Germany, and Argentina
# This to find the find the numbers of home and aways games for each country
brazil_home <- subset(worldcup_clean, Home.Team.Name == "Brazil")
brazil_away <- subset(worldcup_clean, Away.Team.Name == "Brazil")

germany_home <- subset(worldcup_clean, Home.Team.Name == "Germany")
germany_away <- subset(worldcup_clean, Away.Team.Name == "Germany")

argentina_home <- subset(worldcup_clean, Home.Team.Name == "Argentina")
argentina_away <- subset(worldcup_clean, Away.Team.Name == "Argentina")

print("Brazil home matches:")
nrow(brazil_home)
print("Brazil away matches:")
nrow(brazil_away)

print("Germany home matches:")
nrow(germany_home)
print("Germany away matches:")
nrow(germany_away)

print("Argentina home matches:")
nrow(argentina_home)
print("Argentina away matches:")
nrow(argentina_away)

# ==================== PATTERN 4 EXPLORATION ====================
# Pattern 4: High vs Low scoring matches analysis

# This creates a scoring categories using cut function
worldcup_clean$Score_Category <- cut(worldcup_clean$Total.Goals, 
                                     breaks = c(-1, 1, 3, 5, 20), 
                                     labels = c("Low", "Medium", "High", "Very High"))

# This basically the count matches in each scoring category
score_categories <- table(worldcup_clean$Score_Category)
print("Matches by scoring category:")
score_categories

# Create bar plot for scoring categories
barplot(score_categories,
        main = "World Cup Matches by Scoring Level",
        xlab = "Scoring Category",
        ylab = "Number of Matches", 
        col = "purple")

# Analyze scoring by era (before/after 1990)
early_worldcup <- subset(worldcup_clean, Year < 1990)
modern_worldcup <- subset(worldcup_clean, Year >= 1990)

print("Early era (pre-1990) average goals:")
mean(early_worldcup$Total.Goals)
print("Modern era (1990+) average goals:")
mean(modern_worldcup$Total.Goals)


# ==================== SOME ADDITIONAL ANALYSIS ====================

# This block of code gives us the goals analysis for home and away team
print("Most goals by home team in a match:")
max(worldcup_clean$Home.Team.Goals)
print("Most goals by away team in a match:")
max(worldcup_clean$Away.Team.Goals)

# Find matches with maximum goals
max_goals <- max(worldcup_clean$Total.Goals)
highest_scoring_matches <- subset(worldcup_clean, Total.Goals == max_goals)
print("Highest scoring match(es):")
highest_scoring_matches

# World Cup with most matches played
matches_per_year <- table(worldcup_clean$Year)
print("Matches per World Cup year:")
matches_per_year

# ==================== ERA COMPARISON ====================

# Compare different eras more specifically to see what's the trend
very_early <- subset(worldcup_clean, Year <= 1950)
early <- subset(worldcup_clean, Year > 1950 & Year <= 1970)
middle <- subset(worldcup_clean, Year > 1970 & Year <= 1990)
recent <- subset(worldcup_clean, Year > 1990)

print("Very early era (1930-1950) average goals:")
mean(very_early$Total.Goals)
print("Early era (1950-1970) average goals:")
mean(early$Total.Goals)
print("Middle era (1970-1990) average goals:")
mean(middle$Total.Goals)
print("Recent era (1990+) average goals:")
mean(recent$Total.Goals)

# ==================== VISUALIZATION SUMMARY ====================

# Create a summary plot showing evolution over time
plot(names(goals_by_year), goals_by_year, 
     type = "b",
     main = "World Cup Scoring Evolution Over Time",
     xlab = "World Cup Year",
     ylab = "Average Goals per Match", 
     col = "darkred")


# ==================== TEAM PERFORMANCE ANALYSIS ====================

# Goals scored by specific teams when playing at home
brazil_home_goals <- mean(brazil_home$Home.Team.Goals)
germany_home_goals <- mean(germany_home$Home.Team.Goals)
argentina_home_goals <- mean(argentina_home$Home.Team.Goals)

print("Average goals scored by Brazil at home:")
brazil_home_goals
print("Average goals scored by Germany at home:")  
germany_home_goals
print("Average goals scored by Argentina at home:")
argentina_home_goals


# ==================== LOW SCORING MATCHES ==================== 

# This block of code find very low scoring matches (0 goals)  
scoreless_matches <- subset(worldcup_clean, Total.Goals == 0)
print("Number of scoreless matches:")
nrow(scoreless_matches)

# This block find high scoring matches (6+ goals)
high_scoring <- subset(worldcup_clean, Total.Goals >= 6)
print("Number of high scoring matches (6+ goals):")
nrow(high_scoring)

# ==================== SUMMARY STATISTICS ====================
print("=== FINAL SUMMARY FOR ARTICLE ===")
print("Total matches analyzed:")
nrow(worldcup_clean)

print("Overall average goals per match:")
mean(worldcup_clean$Total.Goals)

print("Years covered:")
min(worldcup_clean$Year)
max(worldcup_clean$Year)

print("Number of scoreless matches:")
nrow(scoreless_matches)

print("Number of high-scoring matches:")
nrow(high_scoring)

print("Most goals in a single match:")
max(worldcup_clean$Total.Goals)
