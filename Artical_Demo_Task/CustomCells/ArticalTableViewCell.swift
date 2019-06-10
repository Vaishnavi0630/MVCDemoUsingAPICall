//
//  ArticalTableViewCell.swift
//  Artical_Demo_Task
//
//  Created by Admin on 10/06/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ArticalTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
