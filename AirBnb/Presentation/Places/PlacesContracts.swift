//
//  PlacesContracts.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation

protocol PlacesViewModelProtocol {
    var delegate: PlacesViewModelDelegate? { get set }

    func loadPlaces()
    func loadCategories()
}

enum PlacesViewModelOutput {
    case setLoading(Bool)
    case placesList([Place])
    case categoryList(CategoryCellComponentListData)
}

protocol PlacesViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: PlacesViewModelOutput)
}
