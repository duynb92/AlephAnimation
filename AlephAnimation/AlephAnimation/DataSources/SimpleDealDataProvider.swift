//
//  DealDataSource.swift
//  AlephAnimation
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import Foundation
import UIKit

class SimpleDealDataProvider : NSObject, UITableViewDataSource, UITableViewDelegate {
    var deals = [
        Deal(title: "HMV Calvin Harris Album", amount: 38, totalAmount: 90, distance: 248, thumbnail: "calvinharris"),
        Deal(title: "Levi's 501 Release Party", amount: 16, totalAmount: 42, distance: 136, thumbnail: "levis"),
        Deal(title: "Billy Bombers Hot Dog", amount: 14, totalAmount: 22, distance: 2, thumbnail: "hotdog"),
        Deal(title: "Starbucks Coffee Mob", amount: 80, totalAmount: 167, distance: 136, thumbnail: "starbucks"),
        Deal(title: "MCDonalds Sale", amount: 38, totalAmount: 90, distance: 1000, thumbnail: "mcdonald"),
        Deal(title: "SG Air College Flights", amount: 14, totalAmount: 16, distance: 16400, thumbnail: "sg-air"),
        ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealSimpleTableViewCell", for: indexPath) as! DealSimpleTableViewCell
        cell.populateData(name: deals[indexPath.row].title, distance: deals[indexPath.row].distanceDescription())
        
        if indexPath.row < 2 {
            cell.lbName.hero.id = "\(indexPath.row)"
            cell.lbDistance.hero.id = "distance\(indexPath.row)"
        }
        return cell
    }
}
