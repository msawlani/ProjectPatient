//
//  PatientListViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/3/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class PatientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var Table: UITableView!

    var PatientList: [Patient] = []
    var testList: [String] = ["mike", "nick"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.Table.delegate = self
        self.Table.dataSource = self
        self.Table.reloadData()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.Table.reloadData()
    }

    @IBAction func Add(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "AddPatientViewController") as? AddPatientViewController else {
            return
        }
        
        
        //self.push(viewController, animated: false, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PatientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        
        let patient = PatientList[indexPath.row]
        
        cell!.Name.text = patient.name
        cell!.Age.text = patient.age
        //cell!.Name.text = testList[indexPath.row]
        
        return cell!
    }

}
