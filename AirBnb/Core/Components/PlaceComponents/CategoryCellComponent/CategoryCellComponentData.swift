//
//  CategoryCellComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import Foundation

class CategoryCellComponentListData {

    private(set) var list: [CategoryCellComponentData]

    init(list: [CategoryCellComponentData]) {
        self.list = list
    }
}

class CategoryCellComponentData {

    private(set) var title: String
    private(set) var image: String

    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}
