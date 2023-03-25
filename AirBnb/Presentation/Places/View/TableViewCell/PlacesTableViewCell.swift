//
//  PlacesTableViewCell.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation
import UIKit
import SnapKit

class PlacesTableViewCell: UITableViewCell {

    static let identifier = "PlacesTableViewCell"

    private var cellData: Place?

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(carousel)
        view.addSubview(favButton)
        view.addSubview(placeName)
        view.addSubview(placeRanking)
        view.addSubview(placeDistance)
        view.addSubview(placeDate)
        view.addSubview(placePrice)
        return view
    }()

    private lazy var carousel: CarouselComponent = {
        let carousel = CarouselComponent(frame: .zero)
        return carousel
    }()

    private lazy var favButton: UIButton = {
        let imageView = UIButton()
        imageView.setImage(UIImage(systemName: "heart"), for: .normal)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var placeName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private lazy var placeRanking: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var placeDistance: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var placeDate: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var placePrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(containerView)
        carousel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(UIScreen.main.bounds.width + 100)
        }

        carousel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width - 60)
        }

        favButton.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(20)
            make.height.width.equalTo(30)
        }

        placeName.snp.makeConstraints { make in
            make.top.equalTo(carousel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }

        placeRanking.snp.makeConstraints { make in
            make.top.equalTo(carousel.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
        }

        placeDistance.snp.makeConstraints { make in
            make.top.equalTo(placeName.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }

        placeDate.snp.makeConstraints { make in
            make.top.equalTo(placeDistance.snp.bottom)
            make.leading.equalToSuperview()
        }

        placePrice.snp.makeConstraints { make in
            make.top.equalTo(placeDate.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
    }

}

extension PlacesTableViewCell {
    func configureCell(place: Place) {
        self.cellData = place
        carousel.setData(data: CarouselComponentData(imageURLs: place.placeImages, cornerRadius: true, isMainPage: true))
        placeName.text = place.placeName
        placeRanking.text = "\(place.placeRank)"
        placeDistance.text = "\(place.placeDistance) kilometre uzakta"
        placeDate.text = place.placeDate
        placePrice.text = "\(place.placePrice) ₺ gece"
    }
}
