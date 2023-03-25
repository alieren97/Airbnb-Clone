//
//  BaseView.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation
import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorViews()
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViews()
        setupView()
    }

    func setupView() {}
    func addMajorViews() {}
}
