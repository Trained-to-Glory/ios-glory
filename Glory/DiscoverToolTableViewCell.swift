//
//  DiscoverToolTableViewCell.swift
//  Glory
//
//  Created by Jaylen Sanders on 8/13/17.
//  Copyright © 2017 Glory. All rights reserved.
//

import UIKit

class DiscoverToolTableViewCell: UITableViewCell {

    @IBOutlet weak var toolImageView: UIImageView!
    @IBOutlet weak var toolName: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
