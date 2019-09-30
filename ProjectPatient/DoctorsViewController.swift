//
//  OmarViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 9/19/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class DoctorsViewController: UIViewController {

    @IBOutlet weak var DoctorImage: UIImageView!
    @IBOutlet weak var DoctorName: UILabel!
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoctorImage.image = UIImage(named: name)
        DoctorName.text = name
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DoctorImage.image = UIImage(named: name)
        DoctorName.text = name
    }

}
