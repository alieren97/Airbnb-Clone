//
//  CarouselComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import Foundation

class CarouselComponentData {

    private(set) var imageURLs: [URL]
    private(set) var cornerRadius: Bool
    private(set) var isMainPage: Bool

    init(imageURLs: [URL], cornerRadius: Bool, isMainPage: Bool) {
        self.imageURLs = imageURLs
        self.cornerRadius = cornerRadius
        self.isMainPage = isMainPage
    }
}
