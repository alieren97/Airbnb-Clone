//
//  SearchContracts.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import Foundation

protocol SearchViewModelProtocol {
    var delegate: SearchViewModelDelegate? { get set }

    func loadContinets()
}

enum SearchViewModelOutput {
    case setLoading(Bool)
    case continentList([Continent])
}

protocol SearchViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: SearchViewModelOutput)
}
