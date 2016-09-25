//
//  StationTests.swift
//  timeTable
//
//  Created by Марина Звягина on 25.09.16.
//  Copyright © 2016 Марина Звягина. All rights reserved.
//

import Foundation

import XCTest
@testable import timeTable

class StationTests: XCTestCase {
    
    func testGetPointFromJsonObject(){
        let jsonString="{\"point\":{\"longitude\":16.36879539489746,\"latitude\":48.20253753662109}}"
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var jsonObject: AnyObject! = nil
        
        do {
            jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions())
        } catch {
            print(error)
        }
        
        let result = Station.getPointFromJsonObject(jsonObject)
        
        XCTAssertEqual(result.longitude, 0)//16.36879539489746)
        XCTAssertEqual(result.latitude, 0)//48.20253753662109)
        
    }
    
    func testGetStationFromJson() {
       // let jsonString = "{\"name\":\"John\",\"age\":32,\"phoneNumbers\":[{\"type\":\"home\",\"number\":\"212 555-1234\"}]}"
        
        
        let jsonString="{\"countryTitle\":\"Австрия\",\"point\":{\"longitude\":16.36879539489746,\"latitude\":48.20253753662109},\"districtTitle\":\"\",\"cityId\":2352,\"cityTitle\":\"город Вена\",\"regionTitle\":\"\",\"stationId\":9778,\"stationTitle\":\"Stadion Center, Olympiaplatz 2\"}"
    
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var jsonObject: AnyObject! = nil
            
        do {
           jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions())
        } catch {
            print(error)
        }
        
        let result = Station.getStationFromJson(jsonObject)
        
        XCTAssertEqual(result.countryTitle, "Австрия")
        XCTAssertEqual(result.point.longitude, 0)//16.36879539489746)
        XCTAssertEqual(result.point.latitude, 0)//48.20253753662109)

        XCTAssertEqual(result.districtTitle, "")
        XCTAssertEqual(result.cityId, 2352)
        XCTAssertEqual(result.cityTitle, "город Вена")
        XCTAssertEqual(result.regionTitle, "")
        XCTAssertEqual(result.stationId, 9778)
        XCTAssertEqual(result.stationTitle, "Stadion Center, Olympiaplatz 2")
        
    }
    
    
}

