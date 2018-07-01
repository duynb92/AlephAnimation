//
//  SimpleDealDataProviderTests.swift
//  AlephAnimationTests
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AlephAnimation

class SimpleDealDataProviderTests: QuickSpec {
    
    override func spec() {
        describe("New initialization") {
            var sut : SimpleDealDataProvider!
            beforeEach {
                sut = SimpleDealDataProvider()
            }
            
            it("numberOfRows is 2") {
                let tableView = UITableView()
                tableView.dataSource = sut
                expect(tableView.numberOfRows(inSection: 0)).to(equal(2))
            }
        }
        
        describe("cell for row") {
            var sut : SimpleDealDataProvider!
            beforeEach {
                sut = SimpleDealDataProvider()
            }
            
            it("config cell is called") {
                let mockTableView =  MockTableView()
                mockTableView.dataSource = sut
                mockTableView.register(MockDealSimpleTableViewCell.self, forCellReuseIdentifier: "DealSimpleTableViewCell")
                let dealManager = DealManager()
                    dealManager.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                sut.setDealManager(dealManager: dealManager)
                mockTableView.reloadData()
                
                let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockDealSimpleTableViewCell
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
class MockDealSimpleTableViewCell : DealSimpleTableViewCell {
    var configCellCalled = false
    override func configCell(name: String?, distance: String?) {
        configCellCalled = true
    }
}
