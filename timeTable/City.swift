//
//  City.swift
//  timeTable
//
//  Created by Марина Звягина on 25.09.16.
//  Copyright © 2016 Марина Звягина. All rights reserved.
//

import Foundation

class City {
    let countryTitle: String
    let point: (longitude: Double, latitude: Double)
    let districtTitle: String
    let cityId: Int
    let cityTitle: String
    let regionTitle: String
    let stations: Array<Station>
    
    init(countryTitle: String, point: (longitude: Double, latitude: Double), districtTitle: String, cityId: Int, cityTitle: String, regionTitle: String, stations: Array<Station>) {
        self.countryTitle = countryTitle
        self.point = point
        self.districtTitle = districtTitle
        self.cityId = cityId
        self.cityTitle = cityTitle
        self.regionTitle = regionTitle
        self.stations = stations
    }

    static func getCityFromJson(city: AnyObject)->City{
        let stationsObj = city["stations"] as! Array<AnyObject>
        
        var resultStations = Array<Station>()
        
        for station in stationsObj {
            
            let currentStation = Station.getStationFromJson(station)
            
            resultStations.append(currentStation)
            
        }
        
        let countryTitle = city["countryTitle"] as! String
        let point = Station.getPointFromJsonObject(city)
        let districtTitle = city["districtTitle"] as! String
        let cityId = city["cityId"] as! Int
        let cityTitle = city["cityTitle"] as! String
        let regionTitle = city["regionTitle"] as! String
        let stations = resultStations
        
        let city = City(countryTitle: countryTitle, point: point, districtTitle: districtTitle, cityId: cityId, cityTitle: cityTitle, regionTitle: regionTitle, stations: stations)
        
        return city
        
    }

}