//
//  FlightListViewModel.swift
//  IxigoAssignment
//
//  Created by Manisha Sharma on 28/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation

protocol FlightListViewModelDelegate: class {
    func reloadListView()
}

class FlightListViewModel {
    public var dataListModel: [FlightListModel] = []
    weak var delegate: FlightListViewModelDelegate?
    var flightData: FlightDetailResponse?
    var headerTitle: String?
   
    public func fetchFileListData() {
        fetchData(completionHandler: { [weak self] jsonObject in
            self?.flightData = jsonObject
            DispatchQueue.main.async { [weak self] in
                self?.setUpViewModel()
            }
        })
    }
    
    private func setUpViewModel() {
        guard let flightListResponse = flightData else {
            return
        }
        for flightData in  flightListResponse.flightsData {
            let duration = durationCalculator(firstTime: flightData.takeoffTime,
                                              secondTime: flightData.landingTime)
            let flightName = findPlaneName(flightListResponse, planeId: flightData.airlineCode)
            let citiesName = flightData.originCode + " to " + flightData.destinationCode
            headerTitle = citiesName
            let takeOffTime = getTimeFrom(flightData.takeoffTime)
            let landingTime = getTimeFrom(flightData.landingTime)
            let classType = flightData.standard.rawValue
            let flightPrice = formatPrice(flightData.price)
            let dataModel = FlightListModel(airlineID: flightName,
                                            takeoffTime: takeOffTime,
                                            landingTime: landingTime,
                                            classType: classType,
                                            duration: duration,
                                            originalPrice: flightData.price,
                                            formattedPrice: flightPrice,
                                            landinTimeMilliSecond: flightData.landingTime,
                                            takeOffTimeMillinSeciond: flightData.takeoffTime)
            dataListModel.append(dataModel)
        }
        self.delegate?.reloadListView()
    }
    
    public func sortByPriceTapped() {
        let sortedArray = dataListModel.sorted(by: { (first: FlightListModel, second: FlightListModel) -> Bool in
            if let price1 = Double(first.originalPrice), let price2 = Double(second.originalPrice) {
                return price1 < price2
            }
            return false
        })
        dataListModel = sortedArray
        self.delegate?.reloadListView()
    }

    public func sortByLandingTapped() {
        let sortedArray = dataListModel.sorted(by: { (first: FlightListModel, second: FlightListModel) -> Bool in
            if let price1 = Double(first.landinTimeMilliSecond), let price2 = Double(second.landinTimeMilliSecond) {
                return price1 < price2
            }
            return false
        })
        dataListModel = sortedArray
        self.delegate?.reloadListView()
    }
    
    public func sortBytakeOffTapped() {
        let sortedArray = dataListModel.sorted(by: { (first: FlightListModel, second: FlightListModel) -> Bool in
            if let price1 = Double(first.takeOffTimeMillinSeciond), let price2 = Double(second.takeOffTimeMillinSeciond) {
                return price1 < price2
            }
            return false
        })
        dataListModel = sortedArray
        self.delegate?.reloadListView()
    }
}
