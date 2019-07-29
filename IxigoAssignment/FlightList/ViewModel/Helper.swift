//
//  Helper.swift
//  IxigoAssignment
//
//  Created by Manisha Sharma on 28/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation
struct AppConstants {
    static let url: String =  "https://www.ixigo.com/sampleFlightData"
}

public func getTimeFrom (_ interval : String) -> String {
    let unixTimestamp = Double(interval)!/1000
    let date = Date(timeIntervalSince1970: unixTimestamp)
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "HH:mm"
    let strDate = dateFormatter.string(from: date)
    
    return strDate
}

func durationCalculator(firstTime: String, secondTime: String) -> String {
    guard let startTime = Int(firstTime), let endTime = Int(secondTime) else {
        return ""
    }
    let startTimestamp = startTime/1000
    let endTimestamp = endTime/1000
    let seconds = startTimestamp - endTimestamp
    let hour = seconds / 3600
    
    let minutes = seconds % 3600 / 60
    
    var duration = ""
    if hour > 0 {
        duration = "\(hour)h"
    }
    if minutes > 0 {
        duration += " \(minutes)m"
    }
    return duration
}

func findPlaneName(_ flightData: FlightDetailResponse?, planeId: PlaneId) -> String{
    var flightName: String = ""
    if let map = flightData?.airlineMap {
        for (key, value) in map where key == planeId.rawValue{
            flightName = value
        }
    }
    return flightName
}

func formatPrice(_ price: String) -> String {
    return "\u{20B9} \(price)"
}
