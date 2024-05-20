# Load necessary libraries
library(plumber)

# Load the saved GLM model
loaded_glm_model <- readRDS("./models/glm_model.rds")

#* @apiTitle Stroke Prediction Model API
#* @apiDescription Used to predict stroke probability using GLM model.

#* @post /predict_stroke
#* @param gender Factor: Gender (Male/Female)
#* @param age Numeric: Age
#* @param hypertension Factor: Hypertension (0/1)
#* @param heart_disease Factor: Heart disease (0/1)
#* @param ever_married Factor: Ever married (Yes/No)
#* @param work_type Factor: Work type
#* @param Residence_type Factor: Residence type (Urban/Rural)
#* @param avg_glucose_level Numeric: Average glucose level
#* @param bmi Numeric: BMI
#* @param smoking_status Factor: Smoking status
#* @serializer unboxedJSON
predict_stroke <- function(gender, age, hypertension, heart_disease, ever_married, work_type, Residence_type,
                           avg_glucose_level, bmi, smoking_status) {
  
  # Prepare input data
  new_data <- data.frame(
    gender = factor(gender, levels = c("Male", "Female")),
    age = as.numeric(age),
    hypertension = factor(hypertension),
    heart_disease = factor(heart_disease),
    ever_married = factor(ever_married, levels = c("Yes", "No")),
    work_type = factor(work_type),
    Residence_type = factor(Residence_type, levels = c("Urban", "Rural")),
    avg_glucose_level = as.numeric(avg_glucose_level),
    bmi = as.numeric(bmi),
    smoking_status = factor(smoking_status)
  )
  
  # Predict stroke probability
  prediction <- predict(loaded_glm_model, newdata = new_data, type = "response")
  
  # Return the prediction
  return(as.character(prediction))
}
