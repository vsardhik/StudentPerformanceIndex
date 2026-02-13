STUDENT PERFORMANCE INDEX – iOS APPLICATION

PROJECT OVERVIEW
Student Performance Index is an iOS application developed using Swift and CoreML.
The application predicts a student’s performance score based on academic and lifestyle inputs using a trained machine learning regression model.

The app collects user inputs, sends them to a CoreML model, and displays the predicted performance index.

MACHINE LEARNING MODEL DETAILS
Model Name: GEUPerformanceIndexPrediction1
Model Type: Tabular Regressor (GLM Regressor)

Model Pipeline:

One Hot Encoder

Feature Vectorizer

Generalized Linear Model (GLM)

The model predicts a numerical Performance Index value.

INPUT PARAMETERS

Previous Scores (Double)

Entered using UITextField

Hours Studied (Double)

Selected using UIStepper

Sleep Hours (Double)

Selected using UIStepper

Sample Question Papers Practiced (Double)

Selected using UIStepper

Extracurricular Activities (String: "Yes" or "No")

Selected using UISwitch

OUTPUT

Performance_Index (Double)

The predicted value is displayed:

In a UILabel on screen

In a popup alert (UIAlertController)

TECHNOLOGIES USED

Swift

UIKit

CoreML

Xcode

iOS SDK

WORKING PROCESS

User enters Previous Score.

User selects Study Hours, Sleep Hours, and Question Papers Practiced using steppers.

User selects whether they participate in extracurricular activities using a switch.

When the "Calculate" button is tapped:

Input validation is performed.

Data is sent to the CoreML model.

Model returns a predicted Performance Index.

Result is displayed on the screen and in an alert popup.

FEATURES

CoreML Model Integration

Clean and Interactive UI

Input Validation

Error Handling

Prediction Display

Alert Popup Result
