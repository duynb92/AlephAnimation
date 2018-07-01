//
//  DetailDealDataProviderTests.swift
//  AlephAnimationTests
//
//  Created by DuyN on 7/1/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AlephAnimation

class DetailDealDataProviderTests: QuickSpec {
    
    override func spec() {
        describe("New initialization") {
            var sut : DetailDealDataProvider!
            beforeEach {
                sut = DetailDealDataProvider()
            }
            
            it("numberOfRows is 2") {
                let dealManager = DealManager()
                dealManager.addItems(deals: [
                    Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil),
                    Deal(title: "Deal 2", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil),
                    Deal(title: "Deal 3", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil)
                    ])
                sut.setDealManager(dealManager: dealManager)
                let tableView = UITableView()
                tableView.dataSource = sut
                expect(tableView.numberOfRows(inSection: 0)).to(equal(3))
            }
        }
        
        describe("cell for row") {
            var sut : DetailDealDataProvider!
            beforeEach {
                sut = DetailDealDataProvider()
            }
            
            it("config cell is called") {
                let mockTableView =  MockTableView()
                mockTableView.dataSource = sut
                mockTableView.register(MockDealTableViewCell.self, forCellReuseIdentifier: "DealTableViewCell")
                let dealManager = DealManager()
                dealManager.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                sut.setDealManager(dealManager: dealManager)
                mockTableView.reloadData()
                
                let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockDealTableViewCell
                expect(cell.configCellCalled).to(equal(true))
            }
        }
    }
    
}

private class MockTableView : UITableView {
    var cellGotDequeued = false
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        cellGotDequeued = true
        return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}

class MockDealTableViewCell : DealTableViewCell {
    var configCellCalled = false
    override func configCell(image: String?, name: String?, amount: String?, distance: String?) {
        configCellCalled = true
    }
}
