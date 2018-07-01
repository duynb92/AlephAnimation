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
    }
    
}
