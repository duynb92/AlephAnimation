//
//  DealTests.swift
//  AlephAnimationTests
//
//  Created by DuyN on 6/30/18.
//  Copyright © 2018 DuyN. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AlephAnimation

class DealTests: QuickSpec {
    
    override func spec() {
        
        describe("'Deal' amountDescription") {
            context("when amount is nil") {
                it("return nil") {
                    let deal = Deal(title: "Testable Deal", amount: nil, totalAmount: 40, distance: 300, thumbnail: nil)
                    expect(deal.amountDescription()).to(beNil())
                }
            }
            
            context("when totalAmount is nil") {
                it("return nil") {
                    let deal = Deal(title: "Testable Deal", amount: 30, totalAmount: nil, distance: 300, thumbnail: nil)
                    expect(deal.amountDescription()).to(beNil())
                }
            }
            
            context("when amount and totalAmount is nil") {
                it("return nil") {
                    let deal = Deal(title: "Testable Deal", amount: nil, totalAmount: nil, distance: 300, thumbnail: nil)
                    expect(deal.amountDescription()).to(beNil())
                }
            }
         
            context("when amount is 30 and totalAmount is 40") {
                it("return '30 of 40 people'") {
                    let deal = Deal(title: "Testable Deal", amount: 30, totalAmount: 40, distance: 300, thumbnail: nil)
                    expect(deal.amountDescription()).to(equal("30 of 40 people"))
                }
            }
        }
        
        describe("'Deal' distanceDescription") {
            context("when distance is nil") {
                it("return nil") {
                    let deal = Deal(title: "Testable Deal", amount: 30, totalAmount: 40, distance: nil, thumbnail: nil)
                    expect(deal.distanceDescription()).to(beNil())
                }
            }
            
            context("when distance is larger or equal than 1000 and is not a multiply of 1000") {
                it("return distance in km") {
                    let deal = Deal(title: "Testable Deal", amount: 30, totalAmount: 40, distance: 16400, thumbnail: nil)
                    expect(deal.distanceDescription()).to(contain("km"))
                    expect(deal.distanceDescription()).to(equal("16.4km"))
                    expect(deal.distanceDescription()).toNot(equal("16.40km"))
                }
            }
            
            context("when distance is larger or equal than 1000 and is a multiply of 1000") {
                it("return distance in m") {
                    let deal = Deal(title: "Testable Deal", amount: 30, totalAmount: 40, distance: 2000, thumbnail: nil)
                    expect(deal.distanceDescription()).to(contain("km"))
                    expect(deal.distanceDescription()).to(equal("2km"))
                }
            }
            
            context("when distance is smaller than 1000") {
                it("return distance in m") {
                    let deal = Deal(title: "Testable Deal", amount: 30, totalAmount: 40, distance: 456, thumbnail: nil)
                    expect(deal.distanceDescription()).to(contain("m"))
                    expect(deal.distanceDescription()).to(equal("456m"))
                }
            }
            
            context("when distance is smaller than 0") {
                it("return distance in m") {
                    let deal = Deal(title: "Testable Deal", amount: 30, totalAmount: 40, distance: -56, thumbnail: nil)
                    expect(deal.distanceDescription()).to(beNil())
                }
            }
        }
    }
    
}
