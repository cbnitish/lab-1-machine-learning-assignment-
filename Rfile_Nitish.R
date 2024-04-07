library(readr)
library(caret)

# Read the data
data <- read_csv("oulad-students.csv")

# Convert relevant columns to factors and integers
data$code_module <- as.factor(data$code_module)
data$code_presentation <- as.factor(data$code_presentation)
data$gender <- as.factor(data$gender)
data$region <- as.factor(data$region)
data$highest_education <- as.factor(data$highest_education)
data$imd_band <- as.factor(data$imd_band)
data$age_band <- as.factor(data$age_band)
data$num_of_prev_attempts <- as.integer(as.character(data$num_of_prev_attempts))
data$disability <- as.factor(data$disability)
data$final_result <- as.factor(data$final_result)

# Remove rows with missing values
data <- na.omit(data)

# Set seed for reproducibility
set.seed(123)

# Create train-test split
train_index <- createDataPartition(data$final_result, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Build logistic regression model
model <- glm(final_result ~ ., data = train_data, family = binomial)

# Predict probabilities on test data
predictions <- predict(model, newdata = test_data, type = "response")

# Convert probabilities to binary outcome using a threshold of 0.5
predictions <- ifelse(predictions > 0.5, "Pass", "Fail")

# Convert predictions to factor
predictions <- factor(predictions, levels = levels(test_data$final_result))

# Confusion matrix
conf_matrix <- confusionMatrix(predictions, test_data$final_result)
print(conf_matrix)

# Extract overall accuracy
accuracy <- conf_matrix$overall["Accuracy"]

# Check if the class labels 0 and 1 exist in the confusion matrix
if ("0" %in% rownames(conf_matrix$table) && "1" %in% rownames(conf_matrix$table)) {
  # Extract precision and recall for the class label 1
  precision <- conf_matrix$byClass["1", "Precision"]
  recall <- conf_matrix$byClass["1", "Sensitivity"]
  
  # Calculate F1 score
  f1_score <- 2 * (precision * recall) / (precision + recall)
} else {
  # If class labels 0 and 1 don't exist, set precision, recall, and F1 score to NA
  precision <- NA
  recall <- NA
  f1_score <- NA
}

# Create a dataframe with the metrics
metrics_df <- data.frame(Metric = c("Accuracy", "Precision", "Recall", "F1 Score"),
                         Value = c(accuracy, precision, recall, f1_score))

# Plot the metrics
barplot(metrics_df$Value, names.arg = metrics_df$Metric, col = "skyblue", ylim = c(0, 1),
        main = "Model Evaluation Metrics", ylab = "Value")

