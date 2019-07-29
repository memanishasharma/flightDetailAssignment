//
//  FlightListModel.swift
//  IxigoAssignment
//
//  Created by Manisha Sharma on 28/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation

public struct FlightListModel {
    public let airlineID: String
    public let takeoffTime: String
    public let landingTime: String
    public let classType: String
    public let duration: String
    public let originalPrice: String
    public let formattedPrice: String
    public let landinTimeMilliSecond: String
    public let takeOffTimeMillinSeciond: String

    public init(airlineID: String,
                takeoffTime: String,
                landingTime: String,
                classType: String,
                duration: String,
                originalPrice: String,
                formattedPrice: String,
                landinTimeMilliSecond: String,
                takeOffTimeMillinSeciond: String) {
        self.airlineID = airlineID
        self.takeoffTime = takeoffTime
        self.landingTime = landingTime
        self.classType = classType
        self.duration = duration
        self.originalPrice = originalPrice
        self.formattedPrice = formattedPrice
        self.landinTimeMilliSecond = landinTimeMilliSecond
        self.takeOffTimeMillinSeciond = takeOffTimeMillinSeciond
    }
}
