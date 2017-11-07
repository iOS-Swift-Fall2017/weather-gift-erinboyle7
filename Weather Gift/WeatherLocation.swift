//
//  WeatherLocation.swift
//  Weather Gift
//
//  Created by Erin Boyle on 11/6/17.
//  Copyright © 2017 Erin Boyle. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
