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
    let cityTitle: String
    let regionTitle: String
    let stationId: Int
    let stationTitle: String
    
    init(countryTitle: String, point: (longitude: Double, latitude: Double), districtTitle: String, cityTitle: String, regionTitle: String, stationId: Int, stationTitle: String)
    {
        self.countryTitle = countryTitle
        self.point = point
        self.districtTitle = districtTitle
        self.cityTitle = cityTitle
        self.regionTitle = regionTitle
        self.stationId = stationId
        self.stationTitle = stationTitle
    }
    
    
}