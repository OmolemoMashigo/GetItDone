//
//  APIServiceTests.swift
//  GetItDoneTests
//
//  Created by Omolemo Mashigo on 2025/10/27.
//

import XCTest
@testable import GetItDone
final class APIServiceTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    var apiService: APIService!
    
    override func tearDown() {
        apiService = nil
        super.tearDown()
    }
    
    func testGetWeatherDataSuccess() {
        
    }
    
    func testGetWeatherDataFailure(){
        
    }
    
    func testGetAstronomyDataSuccess(){
        
    }
    
    func testGetAstronomyDataFailure(){
        
    }
    
    func testFormatDate_validDate(){
        
    }
    
    func testFormatDate_invalidDate(){
        
    }
}
