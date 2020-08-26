//
//  ViewController.swift
//  WeeklyDayFinder
//
//  Created by Kisacka on 26/08/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // dayTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleCalculation(){
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
            print("text field err")
            warningPopup(widthTitle: "Input Error!", widthMessage: "Date field can't be empty.")
            return
            
        }
        
        dateComponent.day = Int(day)
        dateComponent.month = Int(month)
        dateComponent.year = Int(year)
        
        let date = calendar.date(from: dateComponent)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date!)
                let capitalizedWeekday = weekday.capitalized
                resultLabel.text = capitalizedWeekday
            } else {
                warningPopup(widthTitle: "Wrong date!", widthMessage: "Please enter correct day!")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearTextField()
        }
        
//        let weekday = dateFormatter.string(from: date!)
//
//        let capitalizedWeekday = weekday.capitalized
//
//        resultLabel.text = weekday
        
    }
    
    func clearTextField() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Find a weekday"
    }
    
    
    func warningPopup(widthTitle title: String, widthMessage message: String) {
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUp.addAction(okButton)
            self.present(popUp, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func findWeekDayTapped(_ sender: Any) {
        handleCalculation()
    }
    
}

