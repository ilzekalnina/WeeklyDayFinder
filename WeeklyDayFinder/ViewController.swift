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
        guard let day = dayTextField.text, let month = monthTextField, let year = yearTextField.text else {
            return
            
        }
        
        dateComponent.day = Int(day)
        dateComponent.month = Int(month)
        dateComponent.year = Int(year)
        
        let date = calendar.date(from: dateComponent)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date)
        
        let capitalizedWeekday = weekday.capitalized
        
        resultLabel.text = weekday
        
    }
    

    @IBAction func findWeekDayTapped(_ sender: Any) {
    }
    
}

