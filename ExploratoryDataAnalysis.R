# Load dataset
stroke_data <- read.csv("data/stroke_data.csv", colClasses = c(
  gender = "factor",
  age = "numeric",
  hypertension = "factor",
  heart_disease = "factor",
  ever_married = "factor",
  work_type = "factor",
  Residence_type = "factor",
  avg_glucose_level = "numeric",
  bmi = "numeric",
  smoking_status = "factor",
  stroke = "factor"
))

# Display the structure of the dataset
str(stroke_data)

# View the first few rows of the dataset
head(stroke_data)

# View the dataset in a separate viewer window
View(stroke_data)


# Measures of Frequency
# Count of stroke events
stroke_count <- table(stroke_data$stroke)
print("Frequency of stroke events:")
print(stroke_count)

# Measures of Central Tendency
# Mean age
mean_age <- mean(stroke_data$age, na.rm = TRUE)
print("Mean age:")
print(mean_age)

# Median avg_glucose_level
median_glucose <- median(stroke_data$avg_glucose_level, na.rm = TRUE)
print("Median avg_glucose_level:")
print(median_glucose)

# Measures of Distribution
# Standard deviation of BMI
sd_bmi <- sd(stroke_data$bmi, na.rm = TRUE)
print("Standard deviation of BMI:")
print(sd_bmi)

# Range of avg_glucose_level
range_glucose <- range(stroke_data$avg_glucose_level, na.rm = TRUE)
print("Range of avg_glucose_level:")
print(range_glucose)

# Measures of Relationship
# Correlation between age and avg_glucose_level
correlation_age_glucose <- cor(stroke_data$age, stroke_data$avg_glucose_level, use = "complete.obs")
print("Correlation between age and avg_glucose_level:")
print(correlation_age_glucose)

# Association between smoking status and stroke using Chi-square test
chi_square_smoking_stroke <- chisq.test(table(stroke_data$smoking_status, stroke_data$stroke))
print("Chi-square test for association between smoking status and stroke:")
print(chi_square_smoking_stroke)

