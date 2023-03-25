//
//  PlaceDetailHeaderComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 24.03.2023.
//

import Foundation

class PlaceDetailHeaderComponentData {

    private(set) var placeDetailTitle: String?
    private(set) var placeDetailLocation: String?
    private(set) var placeDetailRate: String?

    init(placeDetailTitle: String? = nil, placeDetailLocation: String? = nil, placeDetailRate: String? = nil) {
        self.placeDetailTitle = placeDetailTitle
        self.placeDetailLocation = placeDetailLocation
        self.placeDetailRate = placeDetailRate
    }

}
