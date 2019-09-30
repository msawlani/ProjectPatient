//
//  DoctorListViewController.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 9/18/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class DoctorListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorsViewController") as? DoctorsViewController
        
        vc?.name = "Omar"
        
        self.navigationController?.pushViewController(vc!, animated: true)
        //self.performSegue(withIdentifier: "Doctors", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DoctorsCollectionViewCell
        cell.DoctorImage.image = UIImage(named: "Omar.jpeg")
        cell.DoctorName.text = "Omar"
        return cell
    }

}
