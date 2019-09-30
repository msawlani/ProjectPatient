//
//  AddPatientViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/3/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit
import Firebase


class AddPatientViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    var docRef: DocumentReference?
    var doc: Doctor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        docRef = Firestore.firestore().document("Patients/appointments")
        
        navigationItem.hidesBackButton = true;
        
        let backNavButton = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(BackButton))
        
        let doneNavButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(DoneButton))
        
        self.navigationItem.rightBarButtonItem = doneNavButton
        self.navigationItem.leftBarButtonItem = backNavButton
        
        // Do any additional setup after loading the view.
    }
    
    @objc func DoneButton(){
        
        if CheckInput() == false{
            return
        }
        
        let patient = createPatient()
        guard let home = self.navigationController?.viewControllers.first as? PatientListViewController else {
            return
        }
        
        home.PatientList.append(patient)
        doc?.appointmentList.append(patient)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func BackButton(){
        if !nameTextField.text!.isEmpty || !ageTextField.text!.isEmpty{
        let alert = UIAlertController(title: "Going Back?", message: "Doing this will lose all data on this page", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {(action) in
            self.navigationController?.popViewController(animated: true)
            
        }))
        
        self.present(alert, animated: true)
        }
        self.navigationController?.popViewController(animated: true)

    }
    
    
    func createPatient() -> Patient {
        let patient = Patient(name: nameTextField.text!, age: ageTextField.text!)
        return patient
    }
    
    func CheckInput() -> Bool{
        let check = true
        if self.nameTextField.text!.isEmpty && !self.ageTextField.text!.isEmpty{
            let alert = UIAlertController(title: "Failed to add patient", message: "Name is empty, must enter a name", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)

            return false
        }
        
        if self.ageTextField.text!.isEmpty && !self.nameTextField.text!.isEmpty{
            let alert = UIAlertController(title: "Failed to add patient", message: "Age is empty, must enter a age", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)

            return false
        }
        
        if self.ageTextField.text!.isEmpty && self.nameTextField.text!.isEmpty{
            let alert = UIAlertController(title: "Failed to add patient", message: "Please fill out the information", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            return false
        }
        
        return check
    }

}
