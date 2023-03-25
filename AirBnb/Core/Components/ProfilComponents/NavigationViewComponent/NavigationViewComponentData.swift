//
//  NavigationViewComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit

class NavigationViewComponentData {
    private(set) var type: NavigationViewTypes
    private(set) var title: String
    private(set) var titleImage: String

    init(type: NavigationViewTypes, title: String, titleImage: String) {
        self.type = type
        self.title = title
        self.titleImage = titleImage
    }
}

enum NavigationViewTypes {
    case personalInformation, taxes
}
