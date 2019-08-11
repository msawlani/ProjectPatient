//
//  LogViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/10/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func DoctorLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "DoctorLog", sender: self)
    }
    @IBAction func PatientLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "PatientLog", sender: self)

    }
    
}
