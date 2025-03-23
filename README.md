# Data-Science-in-Finance-Credit-Risk-Analysis

# Project Explanation: Credit Risk Analysis Using Decision Tree Model

This project aims to analyze credit risk using a decision tree model. The main focus of this analysis is to predict the credit risk rating for applicants based on certain features, such as loan duration and number of dependents. The dataset used consists of credit scoring data, which includes various financial attributes of the applicants.

## Project Objectives
1. **Predicting Credit Risk**: Building a model to predict the credit risk category (low, medium, or high) based on the available features in the dataset.
2. **Applying the Decision Tree Model**: Using the `C5.0` decision tree algorithm to make predictions based on the training data.

## Dataset Explanation
The dataset used contains several key features, including:
- **loan_duration_months**: Loan duration in months.
- **number_of_dependents**: The number of dependents the loan applicant has.
- **risk_rating**: The target variable, indicating the credit risk rating, categorized as `low`, `medium`, or `high`.

## Steps in the Analysis

### 1. **Data Preprocessing**
The data is first loaded and prepared by converting the `risk_rating` column into a factor type for classification purposes. Afterward, two relevant columns, `loan_duration_months` and `number_of_dependents`, are selected for the modeling process.

### 2. **Data Splitting**
The dataset is split into two sets:
- **Training Set**: Used to train the decision tree model.
- **Testing Set**: Used to test the performance of the trained model.

### 3. **Decision Tree Model Building**
A decision tree model is created using the `C5.0` algorithm with the prepared training data. This model will classify the credit risk based on the two selected features.

### 4. **Predictions and Evaluation**
Once the model is trained, predictions are made on the testing set. The predicted results are compared with the actual `risk_rating` values from the testing set. A confusion matrix is created to evaluate the model's performance.

### 5. **Model Accuracy Calculation**
The accuracy of the model is calculated by counting the number of correct and incorrect predictions. The model is expected to predict credit risk with a high level of accuracy.

### 6. **Predicting New Data**
The trained model can also be used to predict the credit risk of new applicants by feeding new data into the model.

## Results and Conclusion
The decision tree model effectively predicts credit risk ratings based on the available features. This model provides valuable insights for financial institutions to manage credit risk. The model's accuracy can be improved by optimizing parameters or using additional features in the data.

## Future Work
- **Experimenting with other machine learning algorithms**: Trying algorithms like Random Forest or XGBoost to see if there's an improvement in accuracy.
- **Adding more features**: Including additional features such as income level, employment status, or credit history to improve the model's predictions.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
