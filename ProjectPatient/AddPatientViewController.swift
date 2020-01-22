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
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var DoBTextField: UITextField!
    @IBOutlet weak var GenderTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var doctorTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var discriptionTextField: UITextView!
    
    var time = ""
    var ref: DatabaseReference?
    private var timePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.hidesBackButton = true;
        
        let backNavButton = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(BackButton))
        
        let doneNavButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(DoneButton))
        
        self.navigationItem.rightBarButtonItem = doneNavButton
        self.navigationItem.leftBarButtonItem = backNavButton
        
            timeTextField.text = time
        ref = Database.database().reference()
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        timeTextField.inputView = timePicker
        timePicker?.addTarget(self, action: #selector(timeChanged(timePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer: )))
        
        view.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view.
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        timeTextField.text = time
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func timeChanged(timePicker: UIDatePicker){
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "h:m:s"
        timeTextField.text = timeFormat.string(from: timePicker.date)
        view.endEditing(true)
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
    
    
    func createPatient() -> Appointment {
        let patient = Appointment(name: nameTextField.text!, age: ageTextField.text!)
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
