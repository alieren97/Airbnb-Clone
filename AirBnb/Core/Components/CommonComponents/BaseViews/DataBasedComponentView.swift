//
//  DataBasedComponentView.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation
import UIKit

class DataBasedComponentView<T>: BaseView {
    private var data: T?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(frame: CGRect = .zero, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        loadDataIntoViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setData(data: T?) {
        self.data = data
        loadDataIntoViews()
    }

    func returnData() -> T? {
        return self.data
    }

    func loadDataIntoViews() {

    }
}
