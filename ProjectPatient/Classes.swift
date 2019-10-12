//
//  Classes.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/4/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import Foundation

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

class Doctor{
    var doctorName: String
    
    var appointmentList: [Appointment] = []
    
    init(name: String = "") {
        self.doctorName = name
    }
    
}

class PatientAccount{
    var email:String
    var phoneNumber: String
    var appointments: [Appointment] = []
    
    init(email:String = "", phoneNumber: String = "") {
        self.email = email
        self.phoneNumber = phoneNumber
    }
}

