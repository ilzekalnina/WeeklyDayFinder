//
//  AppearenceViewController.swift
//  WeeklyDayFinder
//
//  Created by Kisacka on 28/08/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit

class AppearenceViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //this func will open Settings on the Simulator Iphone
    @IBAction func openSettingsTapped(_ sender: Any) {
        
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return //this is needed if it is not opening so app don't crash
        }
        
        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL , options: [:]) { (success) in
                print(success)
            }
        }
    }
    
    func setLabelText(){
        var text = "Unable to specify UI style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark mode is on. \nGo to settings if you would like \nto change to Light Mode."
        } else {
            text = "Light mode is on. \nGo to settings if you would like \nto change to Dark Mode."
        }
        
        textLabel.text = text
    }
    
} // end class

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?){
        setLabelText()
    }
}
