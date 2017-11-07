//
//  HourlyWeatherCell.swift
//  Weather Gift
//
//  Created by Erin Boyle on 11/6/17.
//  Copyright © 2017 Erin Boyle. All rights reserved.
//

import UIKit

//global variable but saying private means it can only be accessed inside this file
private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ha"
    return dateFormatter
}()

class HourlyWeatherCell: UICollectionViewCell {
    @IBOutlet weak var hourlyTime: UILabel!
    @IBOutlet weak var hourlyTemp: UILabel!
    @IBOutlet weak var hourlyPrecipProb: UILabel!
    @IBOutlet weak var hourlyIcon: UIImageView!
    @IBOutlet weak var raindropImage: UIImageView!
    
    func update(with hourlyForecast: WeatherDetail.HourlyForecast, timeZone: String) {
        hourlyTemp.text = String(format: "%2.f", hourlyForecast.hourlyTemp) + "°"
        hourlyIcon.image = UIImage(named: "small-" + hourlyForecast.hourlyIcon)
        let precipProb = hourlyForecast.hourlyPrecipProb * 100
        //create a Boolean value
        let isHidden = precipProb < 30
        hourlyPrecipProb.isHidden = isHidden
        raindropImage.isHidden = isHidden
        hourlyPrecipProb.text = String(format: "%2.f", precipProb) + "%"
        let dateString = hourlyForecast.hourlyTime.format(timeZone: timeZone, dateFormatter: dateFormatter)
        hourlyTime.text = dateString
    }
}
