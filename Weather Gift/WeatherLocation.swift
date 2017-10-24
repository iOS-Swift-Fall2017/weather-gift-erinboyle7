//
//  WeatherLocation.swift
//  Weather Gift
//
//  Created by Erin Boyle on 10/23/17.
//  Copyright © 2017 Erin Boyle. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//creating this new file & declaring this gives it app-wide scope
class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return a temperature.")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
