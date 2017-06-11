//
//  SG_PSITests.swift
//  SG PSITests
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import Quick
import Nimble

@testable import SG_PSI

class SG_PSITests: QuickSpec {
    
    override func spec() {
        
        describe("Network Connection Call") {
            
            context("GET PSI Index for different date combinations", closure: {
                
                it("The response should be success", closure: {
                    
                    let dateAndTime = Date().toString(format: Constant.Format.ISODate)
                    
                    waitUntil(timeout: 10.0, action: { done in
                        NetworkConnection.shared.getPSIIndex(time: dateAndTime, completetioHandler: { (success:Bool, response:PSIResponse?, error:Error?) in
                            
                            expect(success).to(beTrue())
                            expect(error).to(beNil())
                            expect(response).to(beAnInstanceOf(PSIResponse.self))
                            expect(response?.regionMetaData?.count) > 0
                            done()
                        })
                    })
                })
                
                it("Future Date: The response should be success with no records", closure: {
                    
                    let dateAndTime = "2018-06-12T02:33:44+0800" //future date
                    
                    waitUntil(timeout: 10.0, action: { done in
                        NetworkConnection.shared.getPSIIndex(time: dateAndTime, completetioHandler: { (success:Bool, response:PSIResponse?, error:Error?) in
                            
                            expect(success).to(beTrue())
                            expect(error).to(beNil())
                            expect(response?.regionMetaData).to(beEmpty())
                            done()
                        })
                    })
                })
                
                it("The response should be fail because date/time is invalid", closure: {
                    let date = "invalidDate"
                    waitUntil(timeout: 10.0, action: { done in
                        NetworkConnection.shared.getPSIIndex(time: date, completetioHandler: { (success:Bool, response:PSIResponse?, error:Error?) in
                            expect(success).to(beFalse())
                            expect(error?.localizedDescription.characters.count) > 0
                            done()
                        })
                    })
                })
            })
        }
        
        describe("Float to String") {
            context("Convert float value into string for direct UI mapping", closure: {
                it("Converts float into String", closure: {
                    
                    let floatValue = Float(3.14)
                    let result = floatValue.stringValue
                    
                    expect(result).to(equal("3.14"))
                })
            })
        }
        
        describe("Date") {
            context("Date to date string", closure: {
                it("Conversion success", closure: {
                    
                    let dateNow = Date()
                    let dateStr = dateNow.toString(format: "YYYY-MM-DD")
                    
                    expect(dateStr.characters.count) > 0
                    expect(dateStr).to(contain("2017-"))
                })
            })
        }
        
    }
}
