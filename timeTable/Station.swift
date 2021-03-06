//
//  Station.swift
//  timeTable
//
//  Created by Марина Звягина on 24.09.16.
//  Copyright © 2016 Марина Звягина. All rights reserved.
//

import Foundation

class Station {
    let countryTitle: String
    let point: (longitude: Double, latitude: Double)
    let districtTitle: String
    let cityId: Int
    let cityTitle: String
    let regionTitle: String
    let stationId: Int
    let stationTitle: String
    
    init(countryTitle: String, point: (longitude: Double, latitude: Double), districtTitle: String, cityId: Int, cityTitle: String, regionTitle: String, stationId: Int, stationTitle: String)
    {
        self.countryTitle = countryTitle
        self.point = point
        self.districtTitle = districtTitle
        self.cityId = cityId
        self.cityTitle = cityTitle
        self.regionTitle = regionTitle
        self.stationId = stationId
        self.stationTitle = stationTitle
    }
/*
    static func getPointFromJsonObject(param: AnyObject)->(longitude: Double, latitude: Double){
        let pointFromStation = param["point"] as AnyObject
        let pointLongitude = pointFromStation["longitude"] as! Double
        let pointLatitude = pointFromStation["latitude"] as! Double
        let point = (pointLongitude,pointLatitude)
        return point
    }
*/
    // Internal bug of xcode don't allow me to use param["point"] as AnyObject
    static func getPointFromJsonObject(station: AnyObject)->(longitude: Double, latitude: Double){
        return (0,0)
    }
    
    static func getStationFromJson(station:AnyObject)->Station{
        let countryTitle = station["countryTitle"] as! String
        
    /*    let pointFromStation = station["point"] as AnyObject
        let pointLongitude = pointFromStation["longitude"] as! Double
        let pointLatitude = pointFromStation["latitude"] as! Double
        let point = (pointLongitude,pointLatitude)
*/

        let point = getPointFromJsonObject(station)
        
        let districtTitle = station["districtTitle"] as! String
        
        let cityId = station["cityId"] as! Int
        
        let cityTitle = station["cityTitle"] as! String
        
        let regionTitle = station["regionTitle"] as! String
        let stationId = station["stationId"] as! Int
        let stationTitle = station["stationTitle"] as! String

        let stat = Station(countryTitle: countryTitle, point: (0,0), districtTitle: districtTitle, cityId: cityId, cityTitle: cityTitle, regionTitle: regionTitle, stationId: stationId, stationTitle: stationTitle)
        
        return stat
        
    }
    
}