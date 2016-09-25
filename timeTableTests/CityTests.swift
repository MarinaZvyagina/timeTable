//
//  CityTests.swift
//  timeTable
//
//  Created by Марина Звягина on 25.09.16.
//  Copyright © 2016 Марина Звягина. All rights reserved.
//

import Foundation

import XCTest
@testable import timeTable

class CityTests: XCTestCase {

    func testGetCityFromJson() {
        
        let station1="{\"countryTitle\":\"Австрия1\",\"point\":{\"longitude\":116.36879539489746,\"latitude\":148.20253753662109},\"districtTitle\":\"1\",\"cityId\":1111,\"cityTitle\":\"город Вена1\",\"regionTitle\":\"1\",\"stationId\":1221,\"stationTitle\":\"1Stadion Center, Olympiaplatz 2\"}"
        let station2="{\"countryTitle\":\"Австрия2\",\"point\":{\"longitude\":216.36879539489746,\"latitude\":248.20253753662109},\"districtTitle\":\"2\",\"cityId\":2222,\"cityTitle\":\"город Вена2\",\"regionTitle\":\"2\",\"stationId\":2112,\"stationTitle\":\"2Stadion Center, Olympiaplatz 2\"}"
        
        
        let jsonString="{\"countryTitle\":\"Австрия\",\"point\":{\"longitude\":16.36879539489746,\"latitude\":48.20253753662109},\"districtTitle\":\"\",\"cityId\" : 2352,\"cityTitle\" : \"Вена\",\"regionTitle\" : \"\",\"stations\":["+station1+","+station2+"]}"
        
    
        
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var jsonObject: AnyObject! = nil
        
        do {
            jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions())
        } catch {
            print(error)
        }
        
        
        let result = City.getCityFromJson(jsonObject)
        
        
       // let result = Station.getStationFromJson(jsonObject)
        
        XCTAssertEqual(result.countryTitle, "Австрия")
        XCTAssertEqual(result.point.longitude, 0)//16.36879539489746)
        XCTAssertEqual(result.point.latitude, 0)//48.20253753662109)
        
        XCTAssertEqual(result.districtTitle, "")
        XCTAssertEqual(result.cityId, 2352)
        XCTAssertEqual(result.cityTitle, "Вена")
        XCTAssertEqual(result.regionTitle, "")
 
        // There is no impotent to check all station field, because it implement in StationTests.swift
        // Here we just check right parse of array elements
        XCTAssertEqual(result.stations.count, 2)
        
        
        
    }
    
}