//
//  SettingsViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/31/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Logout(_ sender: Any) {
        self.performSegue(withIdentifier: "Logout", sender: self)
    }
    
}
