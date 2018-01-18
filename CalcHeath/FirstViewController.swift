//
//  FirstViewController.swift
//  Calc4YourHealth
//
//  Created by Rudcool on 16.01.2018.
//  Copyright © 2018 rudcool inc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    

    
    
//    @IBOutlet weak var ageTextField: UITextField!


    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    @IBOutlet weak var sexSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var activitySegmentControl: UISegmentedControl!
    
    @IBOutlet weak var countButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    @IBAction func ResetButton(_ sender: Any) {
    
    
    let test = Test()
    if test {
    Reset()
    } else {
    Reset()
    }
    countButton.isEnabled = true
       }
    
    
    
    @IBAction func Tapped(_ sender: Any)
        
        
    {
        let test = Test()
        if test {
            Vich()
        } else {
            resultLabel.text = """
            К сожалению вы ввели не все данные для подсчета!
            Нажмите кнопку "Reset" чтобы попробовать снова.
            
            """
            denabledButton()
        }
    }
    
    
    
    
    func Test() ->Bool {
        if ageTextField.text == nil
            || heightTextField.text == nil
            || weightTextField.text == nil
            || sexSegmentControl.selectedSegmentIndex == -1
            || activitySegmentControl.selectedSegmentIndex == -1 {
            return false
        } else {
            return true
        }
    }
    
    func denabledButton() {
        countButton.isEnabled = false
    }
    func Reset() {
        ageTextField.text = ""
        weightTextField.text = ""
        heightTextField.text = ""
        sexSegmentControl.selectedSegmentIndex = -1
        activitySegmentControl.selectedSegmentIndex = -1
        resultLabel.text = ""
        print("Reset")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func Vich() {
        countButton.isEnabled = true
        
        var bmr: Double = 0
        var bmi: Double = 0
        if let age: Int = Int(ageTextField.text ?? "") {
            
            if let height: Int = Int(heightTextField.text ?? "") {
                
                if let weight: Int = Int(weightTextField.text ?? "") {
                    
                    switch sexSegmentControl.selectedSegmentIndex {
                    case 0:
                        bmr = 88.362 + 13.397 * Double(weight) + 4.799 * Double(height) - 5.677 * Double(age)
                        
                    case 1:
                        bmr = 447.593 + 9.247 * Double(weight) + 3.098 * Double(height) - 4.330 * Double(age)
                        
                    default:
                        bmr = 0
                    }
                    bmi = Double(weight) / pow(Double(height) / 100, 2)
                    
                }
            }
        }
        
        let factor = [1.375, 1.55, 1.725, 1.9]
        print("index= ", activitySegmentControl.selectedSegmentIndex)
        let selectedFactor = factor[activitySegmentControl.selectedSegmentIndex]
        bmr *= selectedFactor
        resultLabel.text = "Вы должны потреблять \(Int(bmr)) килокалорий для поддержания веса.\nИндекс массы тела \(Int(bmi))."
    }
}

















