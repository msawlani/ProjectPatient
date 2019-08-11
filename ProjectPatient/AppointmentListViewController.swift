//
//  ApointmentListViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/11/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class AppointmentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var Table: UITableView!
    var AppointmentList: [Patient] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppointmentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        
        let appointment = AppointmentList[indexPath.row]
        
        cell!.Name.text = appointment.name
        cell!.Age.text = appointment.age
        
        return cell!
    }
    
}
