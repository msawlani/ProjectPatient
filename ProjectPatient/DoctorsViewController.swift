//
//  OmarViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 9/19/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class DoctorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var DoctorImage: UIImageView!
    @IBOutlet weak var DoctorName: UILabel!
    @IBOutlet weak var Table: UITableView!
    
    var name = ""

    let time = ["10:00 AM", "11:00 AM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        DoctorImage.image = UIImage(named: name)
        DoctorName.text = name
        
        self.Table.delegate = self
        self.Table.dataSource = self
        self.Table.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DoctorImage.image = UIImage(named: name)
        DoctorName.text = name
        self.Table.reloadData()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddPatientViewController") as? AddPatientViewController
        
        vc?.time = time[indexPath.row]
        vc?.doctorName = DoctorName.text!
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TimeSlotTableViewCell
        
        let timeSlot = time[indexPath.row]
        
        cell!.TimeSlot.text = timeSlot
        
        return cell!
    }
    
}
