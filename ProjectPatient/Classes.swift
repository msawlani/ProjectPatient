//
//  Classes.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/4/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import Foundation
import Firebase


class Doctor{
    var doctorName: String
    
    var appointmentList: [Appointment] = []
    
    init(name: String = "") {
        self.doctorName = name
    }
    
}

class Users: NSObject{
    var email:String
    var phoneNumber: String
    var patients: [PatientAccount] = []
    var ref: DatabaseReference?
    
    init(email:String = "", phoneNumber: String = "") {
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
    func StoreinFirebase(){
        
    }
}


class PatientAccount{
    var email:String
    var phoneNumber: String
    var appointments: [Appointment] = []
    var ref: DatabaseReference?
    
    init(email:String = "", phoneNumber: String = "") {
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
}

class Appointment{
    var name: String
    var age: String
    var dob: String
    var gender: String
    var doctor: String
    var date: String
    var time: String
    var discription: String
    
    init(name:String = "", age:String = "", dob:String = "", gender: String = "", doctor:String = "", date:String = "", time:String = "", discrip:String = "") {
        
        self.name = name
        self.age = age
        self.dob = dob
        self.gender = gender
        self.doctor = doctor
        self.date = date
        self.time = time
        self.discription = discrip
    }
}


