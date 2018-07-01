//
//  DoubleExtensions.swift
//  AlephAnimation
//
//  Created by DuyN on 7/1/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
