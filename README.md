# lab-1-machine-learning-assignment-
Predicting Student Pass/Fail with Logistic Regression

This repository contains code for predicting student pass/fail using logistic regression. The analysis is based on the studentInfo.csv dataset.

Dataset
The dataset contains information about students including whether they passed or failed, their disability status, and their Index of Multiple Deprivation (IMD) band.

Workflow
Data Preparation: The dataset is loaded and preprocessed. Variables are mutated as necessary, and feature engineering is performed.
Splitting Data: The dataset is split into training and testing sets. The training set comprises 80% of the data, while the testing set comprises 20%.
Modeling: A logistic regression model is specified and incorporated into a workflow along with a recipe for preprocessing.
Model Training: The model is trained using the training data.
Model Evaluation: The model is evaluated using the testing data, and predictions are collected. Accuracy metrics are calculated to assess the model's performance.
Files
studentInfo.csv: The dataset used for analysis.
student_prediction_script.R: R script containing the code for data preprocessing, model training, and evaluation.
README.md: This README file providing an overview of the project.
Usage
To replicate the analysis:

Ensure you have R installed on your system.
Clone this repository to your local machine.
Run the R script student_prediction_script.R in R or RStudio.
Examine the results and metrics obtained from the model evaluation.
Dependencies
The following R packages are required to run the script:

tidyverse
tidymodels
janitor
rsample
Contributor
[Chetla Bhasker Nitish]

