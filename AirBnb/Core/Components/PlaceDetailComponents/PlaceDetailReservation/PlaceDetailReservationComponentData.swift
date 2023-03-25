//
//  PlaceDetailReservationComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 24.03.2023.
//

import Foundation

class PlaceDetailReservationComponentData {
    
    private(set) var placePrice: Int?
    private(set) var placeDate: String?

    init(placePrice: Int? = nil, placeDate: String? = nil) {
        self.placePrice = placePrice
        self.placeDate = placeDate
    }
}
