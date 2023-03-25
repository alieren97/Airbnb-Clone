//
//  CarouselCellComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 24.03.2023.
//

import UIKit
import SnapKit
import Kingfisher


final class CarouselCellComponent: UICollectionViewCell {
    static let identifier = "CarouselCellComponent"

    private lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
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
        contentView.addSubview(placeImageView)
    }

    private func setupLayout() {
        placeImageView.snp.makeConstraints {  $0.edges.equalToSuperview() }

    }
}

extension CarouselCellComponent {
    func configure(with image: URL) {
        placeImageView.kf.setImage(with: image)
    }
}
