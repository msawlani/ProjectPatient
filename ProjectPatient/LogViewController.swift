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
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func DoctorLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "DoctorLog", sender: self)
    }
    @IBAction func PatientLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "PatientLog", sender: self)

    }
    
}
