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

# Check for missing values in each column
missing_values <- sapply(stroke_data, function(x) sum(is.na(x)))
print("Missing values in each column:")
print(missing_values)

# Total missing values in the dataset
total_missing <- sum(missing_values)
print("Total missing values in the dataset:")
print(total_missing)

# Impute missing values in 'bmi' column with mean
mean_bmi <- mean(stroke_data$bmi, na.rm = TRUE)
stroke_data$bmi[is.na(stroke_data$bmi)] <- mean_bmi

# Confirm that missing values have been imputed
missing_values_after_imputation <- sum(is.na(stroke_data$bmi))
print("Missing values in 'bmi' column after imputation:")
print(missing_values_after_imputation)

