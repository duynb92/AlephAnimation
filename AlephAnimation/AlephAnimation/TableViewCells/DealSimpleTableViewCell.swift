//
//  DealSimpleTableViewCell.swift
//  DuysoiAnimation
//
//  Created by Hoang Nguyen on 6/30/18.
//  Copyright © 2018 Hoang Nguyen. All rights reserved.
//

import UIKit

class DealSimpleTableViewCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(name: String) {

        self.lbName.text = name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lbName.hero.id = nil
    }
    
}
