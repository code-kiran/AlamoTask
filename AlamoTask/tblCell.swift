//
//  tblCell.swift
//  AlamoTask
//
//  Created by kiran on 9/7/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class tblCell: UITableViewCell {
    @IBOutlet weak var imag: UIImageView!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var publishedat: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
