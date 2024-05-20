# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Saving the GLM model
saveRDS(model_glm, file = "./models/glm_model.rds")

# Load the saved GLM model
loaded_glm_model <- readRDS("./models/glm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  gender = c("Male", "Female"),  # Example gender values
  age = c(60, 45),  # Example age values
  hypertension = c("0", "1"),  # Example hypertension values
  heart_disease = c("0", "1"),  # Example heart_disease values
  ever_married = c("Yes", "No"),  # Example ever_married values
  work_type = c("Private", "Self-employed"),  # Example work_type values
  Residence_type = c("Urban", "Rural"),  # Example Residence_type values
  avg_glucose_level = c(110, 80),  # Example avg_glucose_level values
  bmi = c(28, 22),  # Example bmi values
  smoking_status = c("formerly smoked", "never smoked")  # Example smoking_status values
)

# Use the loaded model to make predictions for new data
predictions_loaded_model <- predict(loaded_glm_model, newdata = new_data, type = "raw")

# Print predictions
print(predictions_loaded_model)

