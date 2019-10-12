//
//  PatientLogViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 10/12/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class PatientLogViewController: UIViewController {
    @IBOutlet weak var emailFieldText: UITextField!
    @IBOutlet weak var passwordFieldText: UITextField!
    @IBOutlet weak var loginBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func Login(_ sender: Any) {
        self.performSegue(withIdentifier: "PatientMain", sender: self)
    }
    
    @IBAction func Back(_ sender: Any) {

    }
    
}
