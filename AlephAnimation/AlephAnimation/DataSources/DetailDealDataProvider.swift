//
//  DetailDealDataProvider.swift
//  AlephAnimation
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import UIKit

class DetailDealDataProvider : NSObject, UITableViewDataSource, UITableViewDelegate {
    var deals = [
        Deal(title: "HMV Calvin Harris Album", amount: 38, totalAmount: 90, distance: 248),
        Deal(title: "Levi's 501 Release Party", amount: 16, totalAmount: 42, distance: 136),
        Deal(title: "Billy Bombers Hot Dog", amount: 14, totalAmount: 22, distance: 2),
        Deal(title: "Starbucks Coffee Mob", amount: 80, totalAmount: 167, distance: 136),
        Deal(title: "MCDonalds Sale", amount: 38, totalAmount: 90, distance: 1000),
        Deal(title: "SG Air College Flights", amount: 14, totalAmount: 16, distance: 16400),
        ]
    
    var delayLeftTranslateInterval: Double = 0.07
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealTableViewCell", for: indexPath) as! DealTableViewCell
        cell.populateData(name: deals[indexPath.item].title, amount: deals[indexPath.item].amountDescription(), distance: deals[indexPath.item].distanceDescription())
        if indexPath.row < 2 {
            cell.lbName.hero.id = "\(indexPath.row)"
            cell.lbDistance.hero.id = "distance\(indexPath.row)"
        }
        cell.hero.modifiers = [.fade, .translate(x:-100), .arc, .delay(delayLeftTranslateInterval * Double(indexPath.row))]
        return cell
    }
}

