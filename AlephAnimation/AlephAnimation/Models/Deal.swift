//
//  Deal.swift
//  AlephAnimation
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import Foundation

class Deal {
    var title : String?
    var amount : Int?
    var totalAmount : Int?
    var distance : Int?
    var thumbnail : String?
    
    init(title : String?, amount : Int?, totalAmount : Int?, distance : Int?, thumbnail: String?) {
        self.title = title
        self.amount = amount
        self.totalAmount = totalAmount
        self.distance = distance
        self.thumbnail = thumbnail
    }
    
    func amountDescription() -> String? {
        if let amount = amount, let totalAmount = totalAmount {
        return "\(amount) of \(totalAmount) people"
        }
        return nil
    }
    
    func distanceDescription() -> String? {
        if let distance = distance, distance >= 0 {
            if distance >= 1000 && ( (distance%1000) > 0) {
                return "\(Double(Double(distance)/1000).rounded(toPlaces: 1))km"
            } else {
                return distance >= 1000 ? "\(distance/1000)km" : "\(distance)m"
            }
        }
        return nil
    }
}
