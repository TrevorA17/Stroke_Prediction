# Load dataset
stroke_data <- read.csv("data/stroke.csv", colClasses = c(
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
