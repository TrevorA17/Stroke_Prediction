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

# Set seed for reproducibility
set.seed(123)

# Split data into training and testing sets (80% training, 20% testing)
train_index <- sample(1:nrow(stroke_data), 0.8 * nrow(stroke_data))
train_data <- stroke_data[train_index, ]
test_data <- stroke_data[-train_index, ]

# Print the dimensions of the training and testing sets
print("Dimensions of Training Data:")
print(dim(train_data))
print("Dimensions of Testing Data:")
print(dim(test_data))

# Set seed for reproducibility
set.seed(123)

# Function to calculate bootstrap statistic
bootstrap_statistic <- function(data) {
  # Sample with replacement
  boot_sample <- sample(data, replace = TRUE)
  # Calculate statistic (mean, median, etc.) for the bootstrap sample
  return(mean(boot_sample, na.rm = TRUE))  # Adjust as needed
}

# Basic Cross-Validation
library(caret)
set.seed(123)
train_control <- trainControl(method = "cv", number = 10)
model <- train(stroke ~ ., data = stroke_data, method = "glm", trControl = train_control)


# Perform bootstrapping for BMI
num_bootstraps <- 1000  # Number of bootstrap iterations
bootstrap_results <- replicate(num_bootstraps, bootstrap_statistic(stroke_data$bmi))

# Summary of bootstrap results
summary_bootstrap <- summary(bootstrap_results)
print(summary_bootstrap)

# Visualize bootstrap distribution
hist(bootstrap_results, breaks = 30, col = "skyblue", main = "Bootstrap Distribution of BMI", xlab = "Bootstrap Means")
