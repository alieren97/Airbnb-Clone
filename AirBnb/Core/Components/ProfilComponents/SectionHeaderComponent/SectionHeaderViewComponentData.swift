//
//  SectionHeaderViewComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation

class SectionHeaderViewComponentData {

    private(set) var title: String
    private(set) var titleFont: CGFloat

    init(title: String, titleFont: CGFloat) {
        self.title = title
        self.titleFont = titleFont
    }
}
