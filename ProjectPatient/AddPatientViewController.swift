//
//  AddPatientViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/3/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class AddPatientViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let doneNavButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(DoneButton))
        
        self.navigationItem.rightBarButtonItem = doneNavButton
        
        // Do any additional setup after loading the view.
    }
    
    @objc func DoneButton(){
        let patient = createPatient()
        guard let home = self.navigationController?.viewControllers.first as? PatientListViewController else {
            return
        }
        
        home.PatientList.append(patient)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func createPatient() -> Patient {
        var patient = Patient(name: nameTextField.text!, age: ageTextField.text!)
        return patient
    }

}
