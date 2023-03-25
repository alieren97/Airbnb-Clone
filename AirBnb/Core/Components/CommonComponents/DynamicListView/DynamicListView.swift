//
//  DynamicListView.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 24.03.2023.
//

import UIKit

class ConstantConstraintData {
    private(set) var leadingConstant: CGFloat
    private(set) var trailingConstant: CGFloat
    private(set) var topConstant: CGFloat
    private(set) var bottomConstant: CGFloat

    init(leadingConstant: CGFloat = 0, trailingConstant: CGFloat = 0, topConstant: CGFloat = 0, bottomConstant: CGFloat = 0) {
        self.leadingConstant = leadingConstant
        self.trailingConstant = trailingConstant
        self.topConstant = topConstant
        self.bottomConstant = bottomConstant
    }
}

class DynamicListViewData {

    private(set) var view: UIView
    private(set) var constraints: ConstantConstraintData

    init(view: UIView, constraints: ConstantConstraintData) {
        self.view = view
        self.constraints = constraints
    }

}

class DynamicListView: UIScrollView {

    var views: [DynamicListViewData]
    var bottomConstant: CGFloat = -10

    init(frame: CGRect = .zero, views: [DynamicListViewData]) {
        self.views = views
        super.init(frame: frame)
        prepareViewConfiguration()
    }

    init(frame: CGRect = .zero, views: [DynamicListViewData], bottomConstant: CGFloat) {
        self.views = views
        self.bottomConstant = bottomConstant
        super.init(frame: frame)
        prepareViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareViewConfiguration() {
        var previousAnchor = topAnchor

        for item in self.views {

            item.view.translatesAutoresizingMaskIntoConstraints = false

            addSubview(item.view)

            NSLayoutConstraint.activate([
                item.view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: item.constraints.leadingConstant),
                item.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: item.constraints.trailingConstant),
                item.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (item.constraints.leadingConstant - item.constraints.trailingConstant)),
                item.view.topAnchor.constraint(equalTo: previousAnchor, constant: item.constraints.topConstant)
            ])

            previousAnchor = item.view.bottomAnchor
        }

        previousAnchor.constraint(equalTo: bottomAnchor, constant: bottomConstant).isActive = true
    }

    func dynamicListActivationManager(active: Bool, animated: Bool = false) {
        if animated {
            UIView.transition(with: self, duration: 0.3,options: .transitionCrossDissolve) { [weak self] in
                self?.alpha = active ? 1 : 0
            }
        } else {
            alpha = active ? 1 : 0
        }
    }

}
