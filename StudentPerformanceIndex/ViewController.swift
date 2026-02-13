//
//  ViewController.swift
//  StudentPerformanceIndex
//
//  Created by GEU on 13/02/26.
//

import UIKit
import CoreML

class ViewController: UIViewController {
    
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var hoursStepper: UIStepper!
    
    @IBOutlet weak var previousScoreTextField: UITextField!
    
    @IBOutlet weak var extraCurricularSwitch: UISwitch!
    
    @IBOutlet weak var stepHoursLabel: UILabel!
    @IBOutlet weak var stepHoursStepper: UIStepper!
    
    @IBOutlet weak var qpSolvedLabel: UILabel!
    @IBOutlet weak var qpSolvedStepper: UIStepper!
    
    @IBOutlet weak var performanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func hoursStepperChanged(_ sender: UIStepper) {
        hoursLabel.text = String(format: "%.1f", sender.value)
        
    }
    
    @IBAction func stepHoursStepperChanged(_ sender: UIStepper) {
        stepHoursLabel.text = String(format: "%.1f", sender.value)
        
    }
    
    @IBAction func qpSolvedStepperChanged(_ sender: UIStepper) {
        qpSolvedLabel.text = String(format: "%.1f", sender.value)
        
    }
    @IBAction func calculateTapped(_ sender: UIBarButtonItem) {
        
        
        guard let prevScoreText = previousScoreTextField.text,
                 let previousScore = Double(prevScoreText) else {
               performanceLabel.text = "Invalid Input"
               return
           }
           
           let hoursStudied = hoursStepper.value
           let sleepHours = stepHoursStepper.value
           let qpSolved = qpSolvedStepper.value
           let extracurricular = extraCurricularSwitch.isOn ? "Yes" : "No"
           
           do {
               let model = GEUPerformanceIndexPrediction1()
               
               let prediction = try model.prediction(
                Hours_Studied: Int64(hoursStudied),
                Previous_Scores: Int64(previousScore),
                   Extracurricular_Activities: extracurricular,
                Sleep_Hours: Int64(sleepHours),
                Sample_Question_Papers_Practiced: Int64(qpSolved)
               )
               
               let result = prediction.Performance_Index   // ← use EXACT output name
               
               performanceLabel.text = String(format: "%.2f", result)
               
           } catch {
               performanceLabel.text = "Prediction Failed"
               print(error.localizedDescription)
           }
           
           let resultAlert = UIAlertController(
               title: "Result",
               message: performanceLabel.text,
               preferredStyle: .alert
           )
           
           resultAlert.addAction(UIAlertAction(title: "OK", style: .default))
           present(resultAlert, animated: true)
       }
}
