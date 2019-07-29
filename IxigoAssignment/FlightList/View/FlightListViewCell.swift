//
//  FlightListViewCell.swift
//  IxigoAssignment
//
//  Created by Manisha Sharma on 28/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import UIKit

class FlightListViewCell: UITableViewCell {
    @IBOutlet weak var planIdLable: UILabel!
    @IBOutlet weak var startTimeLsbel: UILabel!
    @IBOutlet weak var flightStandardLabel: UILabel!
    @IBOutlet weak var connectionImageView: UIImageView!
    @IBOutlet weak var landingTimeLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    public var item: FlightListModel? {
        didSet {
            planIdLable?.text = item?.airlineID
            startTimeLsbel.text = item?.takeoffTime
            flightStandardLabel.text = item?.classType
            landingTimeLable.text = item?.landingTime
            priceLabel.text = item?.formattedPrice
            durationLabel.text = item?.duration
        }
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
