//
//  NetworkLayer.swift
//  IxigoAssignment
//
//  Created by Manisha Sharma on 28/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation

func fetchData(completionHandler: @escaping (FlightDetailResponse) -> Void) {
    let session = URLSession.shared
    if let url = URL(string: AppConstants.url) {
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else {
                return
            }
            do{

                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FlightDetailResponse.self, from: data)
                completionHandler(jsonData)
            } catch let parsingError {
                print("Error", parsingError)
            }
        })
        task.resume()
    }
}
