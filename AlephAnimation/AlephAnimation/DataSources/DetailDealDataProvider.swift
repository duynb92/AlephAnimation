//
//  DetailDealDataProvider.swift
//  AlephAnimation
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import UIKit

class DetailDealDataProvider : NSObject, UITableViewDataSource, UITableViewDelegate {
    var delayLeftTranslateInterval: Double = 0.07
    var dealManager : DealManager!
    
    func setDealManager(dealManager: DealManager) {
        self.dealManager = dealManager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dealManager.count()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealTableViewCell", for: indexPath) as! DealTableViewCell
        cell.configCell(image: dealManager.item(at: indexPath.item)?.thumbnail, name: dealManager.item(at: indexPath.item)?.title, amount: dealManager.item(at: indexPath.item)?.amountDescription(), distance: dealManager.item(at: indexPath.item)?.distanceDescription())
        if indexPath.row < 2 && cell.lbName != nil && cell.lbDistance != nil {
            cell.lbName.hero.id = "\(indexPath.row)"
            cell.lbDistance.hero.id = "distance\(indexPath.row)"
        }
        cell.hero.modifiers = [.fade, .translate(x:-100), .arc, .delay(delayLeftTranslateInterval * Double(indexPath.row))]
        return cell
    }
}

