//
//  DealTableViewCell.swift
//  DuysoiAnimation
//
//  Created by Hoang Nguyen on 6/30/18.
//  Copyright © 2018 Hoang Nguyen. All rights reserved.
//

import UIKit
import Hero

class DealTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbAmount: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var ivThumb: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.hero.modifiers = [.translate(x: -60), .fade]
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(image: UIImage? = nil, name: String, amount: String, index: Double) {
        self.lbAmount.text = amount
        self.lbName.text = name
        if let image = image {
            self.ivThumb.image = image
        }
//        self.hero.modifiers = [.delay(0.1 * index)]
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lbName.hero.id = nil
    }
    
}
