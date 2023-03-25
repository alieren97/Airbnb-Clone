//
//  NavigationViewComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit
import SnapKit

protocol NavigationComponentDelegate: AnyObject {
    func buttonTapped(type: NavigationViewTypes)
}

final class NavigationViewComponent: DataBasedComponentView<NavigationViewComponentData> {

    private lazy var titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        return label
    }()

    private lazy var navigationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    var type: NavigationViewTypes?
    weak var delegate: NavigationComponentDelegate?

    override func addMajorViews() {
        super.addMajorViews()
        addSubviews()
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        type = data.type
        titleLabel.text = data.title
        titleImageView.image = UIImage(systemName: data.titleImage)
    }

    private func addSubviews() {
        addSubview(titleImageView)
        addSubview(navigationImage)
        addSubview(titleLabel)
        addSubview(lineView)
        addSubview(button)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48),

            titleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleImageView.widthAnchor.constraint(equalToConstant: 20),
            titleImageView.heightAnchor.constraint(equalToConstant: 20),

            navigationImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            navigationImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            navigationImage.widthAnchor.constraint(equalToConstant: 15),
            navigationImage.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.leadingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: navigationImage.leadingAnchor, constant: -20),

            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),

            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    @objc func buttonTapped() {
        guard let type = type else { return }
        delegate?.buttonTapped(type: type)
    }
}
