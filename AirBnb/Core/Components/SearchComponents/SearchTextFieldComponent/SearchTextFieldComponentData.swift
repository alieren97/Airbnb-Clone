//
//  SearchTextFieldComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import Foundation

class SearchTextFieldComponentData {

    private(set) var placeHolder: String?
    private(set) var textFieldImage: String?
    private(set) var isTextFieldEnabled: Bool?

    init(placeHolder: String? = nil, textFieldImage: String? = nil, isTextFieldEnabled: Bool? = nil) {
        self.placeHolder = placeHolder
        self.textFieldImage = textFieldImage
        self.isTextFieldEnabled = isTextFieldEnabled
    }

    func setTextFieldEnabled(by value: Bool) -> Self {
        self.isTextFieldEnabled = value
        return self
    }
}
