//
//  SearchViewModel.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import Foundation

class SearchViewModel: SearchViewModelProtocol {
    var delegate: SearchViewModelDelegate?

    let continents: [Continent] = [
        Continent(continentImage: "globe.europe.africa", title: "World"),
        Continent(continentImage: "globe.europe.africa", title: "Avrupa"),
        Continent(continentImage: "globe.europe.africa", title: "Almanya"),
        Continent(continentImage: "globe.europe.africa", title: "ABD"),
        Continent(continentImage: "globe.europe.africa", title: "Birlesik Krallik"),
        Continent(continentImage: "globe.europe.africa", title: "Avustralya"),
        Continent(continentImage: "globe.europe.africa", title: "İtalya"),
        Continent(continentImage: "globe.europe.africa", title: "Kanada"),
    ]

    func loadContinets() {
        self.notify(.continentList(continents))
    }

    private func notify(_ output: SearchViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
