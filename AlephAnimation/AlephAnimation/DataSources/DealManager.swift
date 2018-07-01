//
//  DealManager.swift
//  AlephAnimation
//
//  Created by DuyN on 7/1/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import Foundation

class DealManager {
    var deals : [Deal] = []
    
    init() {
        
    }
    
    func item(at index: Int) -> Deal? {
        if deals.count > index {
            return deals[index]
        }
        return nil
    }
    
    func addItem(deal: Deal) {
        deals.append(deal)
    }
    
    func addItems(deals: [Deal]) {
        self.deals.append(contentsOf: deals)
    }
    
    func removeItem(at index: Int) {
        if deals.count > index {
            deals.remove(at: index)
        }
    }
    
    func clearItems() {
        deals = []
    }
    
    func count() -> Int {
        return deals.count
    }
}
