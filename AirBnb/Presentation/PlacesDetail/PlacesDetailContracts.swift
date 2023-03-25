//
//  PlacesDetailContracts.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import Foundation

protocol PlacesDetailViewModelProtocol {
    var delegate: PlacesDetailViewModelDelegate? { get set }

}

enum PlacesDetailViewModelOutput {
    case setLoading(Bool)
}

protocol PlacesDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: PlacesDetailViewModelOutput)
}
