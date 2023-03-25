//
//  UIStackView+Extension.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation
import UIKit

public extension UIStackView {
    func removeAllArrangedSubview() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
