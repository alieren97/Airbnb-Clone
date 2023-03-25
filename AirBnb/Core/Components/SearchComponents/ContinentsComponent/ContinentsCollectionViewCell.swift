//
//  ContinentsCollectionViewCell.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import Foundation
import UIKit
import SnapKit

class ContinentsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ContinentsCollectionViewCell"

    override var isSelected: Bool {
        didSet {
            continentImageView.layer.borderColor = isSelected ? UIColor.black.cgColor : nil
            continentImageView.layer.borderWidth = isSelected ? 2 : 0
        }
    }

    private lazy var continentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var continentLabel: UILabel = {
       let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        contentView.addSubview(continentImageView)
        contentView.addSubview(continentLabel)

    }

    private func setupLayout() {
        continentImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(125)
        }

        continentLabel.snp.makeConstraints { make in
            make.top.equalTo(continentImageView.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(20)
        }
    }
}

// MARK: - Configure
extension ContinentsCollectionViewCell {
    func configure(title: String, imgTitle: String) {
        continentImageView.image = UIImage(systemName: imgTitle)
        continentLabel.text = title
    }
}
