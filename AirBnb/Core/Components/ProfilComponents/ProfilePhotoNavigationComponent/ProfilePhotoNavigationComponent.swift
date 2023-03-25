//
//  ProfilePhotoNavigationComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit

final class ProfilePhotoNavigationComponent: DataBasedComponentView<ProfilePhotoNavigationComponentData> {

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemPink
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profili göster"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray3
        label.numberOfLines = 0
        return label
    }()

    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,subTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        titleLabel.text = data.name
        profileImageView.image = UIImage(named: data.userImage)
    }

    private func addSubviews() {
        addSubview(profileImageView)
        addSubview(navigationImage)
        addSubview(titlesStackView)
        addSubview(lineView)
        addSubview(button)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 72),

            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),


            navigationImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            navigationImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            navigationImage.widthAnchor.constraint(equalToConstant: 15),
            navigationImage.heightAnchor.constraint(equalToConstant: 20),

            titlesStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            titlesStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            titlesStackView.trailingAnchor.constraint(equalTo: navigationImage.leadingAnchor, constant: -20),

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
