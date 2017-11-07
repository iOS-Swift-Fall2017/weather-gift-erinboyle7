//
//  TimeInterval+format.swift
//  Weather Gift
//
//  Created by Erin Boyle on 11/6/17.
//  Copyright © 2017 Erin Boyle. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func format(timeZone: String, dateFormatter: DateFormatter) -> String {
        let usableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: usableDate)
        return dateString
    }
     
}
