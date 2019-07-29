//
//  FlightDetailResponse.swift
//  IxigoAssignment
//
//  Created by Manisha Sharma on 28/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation

public struct FlightDetailResponse: Codable {
    public let airlineMap: [String: String]
    public let airportMap: AirportMap
    public let flightsData: [FlightsData]
}

public enum PlaneId: String, Codable {
    case SJ
    case AI
    case G8
    case JA
    case IN
}

public struct AirportMap: Codable {
    public let delhi: String
    public let mumbai: String
    enum CodingKeys: String, CodingKey {
        case delhi = "DEL"
        case mumbai = "MUM"
    }
}

public struct FlightsData: Codable {
    public let originCode: String
    public let destinationCode: String
    public let takeoffTime: String
    public let landingTime: String
    public let price: String
    public let airlineCode: PlaneId
    public let standard: FlightStandard
    
    enum CodingKeys: String, CodingKey {
        case originCode
        case destinationCode
        case takeoffTime
        case landingTime
        case price
        case airlineCode
        case standard = "class"
    }
}

public enum FlightStandard: String, Codable {
    case bussiness = "Business"
    case economy = "Economy"
}
