//
//  FirstViewControllerTests.swift
//  AlephAnimationTests
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AlephAnimation

class FirstViewControllerTests: QuickSpec {
    override func spec() {
        describe("when ViewController is loaded") {
            var sut : FirstViewController!
            beforeEach {
                sut = FirstViewController()
                let _ = sut.view
            }
            context("tableView") {
                it("is not nil") {
                    expect(sut.tbDeals).toNot(beNil())
                }
                
                it("dataSource is set") {
                    expect(sut.tbDeals.dataSource).toNot(beNil())
                    XCTAssertTrue(sut.tbDeals.dataSource is SimpleDealDataProvider)
                    
                }
                
                it("delegate is set") {
                    expect(sut.tbDeals.delegate).toNot(beNil())
                    XCTAssertTrue(sut.tbDeals.delegate is SimpleDealDataProvider)
                }
                
                it("dataSource and delegate is same object") {
                    XCTAssertEqual(sut.tbDeals.dataSource as? SimpleDealDataProvider, sut.tbDeals.delegate as? SimpleDealDataProvider)
                }
            }
        }
    }
    
}
