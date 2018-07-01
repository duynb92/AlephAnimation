//
//  ShadowView.swift
//  AlephAnimation
//
//  Created by DuyN on 7/1/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import Foundation
import UIKit

class ShadowView : UIView {
    override func layoutSubviews() {
        self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        self.layer.borderWidth = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        self.layer.shadowOpacity = 0.7
    }
}
