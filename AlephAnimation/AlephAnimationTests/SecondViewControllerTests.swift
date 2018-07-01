//
//  SecondViewControllerTests.swift
//  AlephAnimationTests
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AlephAnimation

class SecondViewControllerTests: QuickSpec {
    
    override func spec() {
        describe("when ViewController is loaded") {
            var sut : SecondViewController!
            beforeEach {
                sut = SecondViewController()
                let _ = sut.view
            }
            context("tableView") {
                it("is not nil") {
                    expect(sut.tbDeals).toNot(beNil())
                }
                
                it("dataSource is set") {
                    expect(sut.tbDeals.dataSource).toNot(beNil())
                    XCTAssertTrue(sut.tbDeals.dataSource is DetailDealDataProvider)
                    
                }
                
                it("delegate is set") {
                    expect(sut.tbDeals.delegate).toNot(beNil())
                    XCTAssertTrue(sut.tbDeals.delegate is DetailDealDataProvider)
                }
                
                it("dataSource and delegate is same object") {
                    XCTAssertEqual(sut.tbDeals.dataSource as? DetailDealDataProvider, sut.tbDeals.delegate as? DetailDealDataProvider)
                }
            }
        }
    }
    
}
