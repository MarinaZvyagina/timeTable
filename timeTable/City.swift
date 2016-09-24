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
    var stations: Array<Station>
    
    init(countryTitle: String, point: (longitude: Double, latitude: Double), districtTitle: String, cityId: Int, cityTitle: String, regionTitle: String, stations: Array<Station>      ) {
        self.countryTitle = countryTitle
        self.point = point
        self.districtTitle = districtTitle
        self.cityId = cityId
        self.cityTitle = cityTitle
        self.regionTitle = regionTitle
        self.stations = stations
    }
}