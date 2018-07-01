//
//  DealManagerTests.swift
//  AlephAnimationTests
//
//  Created by DuyN on 7/1/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AlephAnimation

class DealManagerTests: QuickSpec {
    
    override func spec() {
        describe("new DealManager") {
            var sut : DealManager!
            beforeEach {
                sut = DealManager()
            }
            context("when initialize") {
                it("return exact 0 items") {
                    expect(sut.count()).to(equal(0))
                }
            }
            
            context("add 2 items") {
                it("return count exact 2") {
                    sut.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                    sut.addItem(deal: Deal(title: "Deal 2", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                    
                    expect(sut.count()).to(equal(2))
                }
            }
            
            context("add 2 items") {
                context("remove at index 0") {
                    it("return count exact 1") {
                        sut.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        sut.addItem(deal: Deal(title: "Deal 2", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        
                        sut.removeItem(at: 0)
                        
                        expect(sut.count()).to(equal(1))
                    }
                    it("the first item got named 'Deal 2'") {
                        sut.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        sut.addItem(deal: Deal(title: "Deal 2", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        
                        sut.removeItem(at: 0)
                        
                        expect(sut.item(at:0)).toNot(beNil())
                        expect(sut.item(at:0)?.title).to(equal("Deal 2"))
                    }
                }
                context("then clear") {
                    it("return count exact 0") {
                        sut.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        sut.addItem(deal: Deal(title: "Deal 2", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        
                        sut.clearItems()
                        
                        expect(sut.count()).to(equal(0))
                    }
                    it("first item is nil") {
                        sut.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        sut.addItem(deal: Deal(title: "Deal 2", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        
                        sut.clearItems()
                        
                        expect(sut.item(at:0)).to(beNil())
                    }
                }
                context("then remove at index 3") {
                    it("return count exact 2") {
                        sut.addItem(deal: Deal(title: "Deal 1", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        sut.addItem(deal: Deal(title: "Deal 2", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil))
                        
                        sut.removeItem(at: 3)
                        
                        expect(sut.count()).to(equal(2))
                    }
                }
            }
        }
    }
}
