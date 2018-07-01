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
    
    var dealManager : DealManager!
    
    func setDealManager(dealManager: DealManager) {
        self.dealManager = dealManager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealSimpleTableViewCell", for: indexPath) as! DealSimpleTableViewCell
        cell.configCell(name: dealManager.item(at: indexPath.row)?.title, distance: dealManager.item(at: indexPath.row)?.distanceDescription())
        
        if indexPath.row < 2 {
            cell.lbName.hero.id = "\(indexPath.row)"
            cell.lbDistance.hero.id = "distance\(indexPath.row)"
        }
        return cell
    }
}
