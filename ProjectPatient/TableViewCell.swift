//
//  TableViewCell.swift
//  ProjectPatient
//
//  Created by Michael Sawlani on 8/3/19.
//  Copyright © 2019 Michael Sawlani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Age: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
