//
//  InfoViewController.swift
//  WeeklyDayFinder
//
//  Created by Kisacka on 28/08/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var infoText = String()
    let appDescText = "This app is a homoework project.\n Which day of the week is your day?\nCheck Dark/Light Mode as well."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appDescLabel.text = appDescText
        
        if !infoText.isEmpty{
            //if not empty
            appInfoLabel.text = infoText
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        print("dismiss VC")
    }
    

}
