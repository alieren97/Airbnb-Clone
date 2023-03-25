//
//  PlacesDetailView.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import Foundation
import UIKit
import SnapKit

final class PlacesDetailView: UIView {

    private var cellData: Place?

    private var dynamicListView: DynamicListView!
    private var viewArray = [DynamicListViewData]()


    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.addSubview(containerView)
        return scrollView
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(carousel)
        view.addSubview(headerView)
        return view
    }()

    lazy var backButtonn: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()

    lazy var heartButtonn: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()

    lazy var shareButtonn: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName:  "square.and.arrow.up"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()

    private lazy var carousel: CarouselComponent = {
        let carousel = CarouselComponent(frame: .zero)
        return carousel
    }()

    private lazy var headerView: PlaceDetailHeaderComponent = {
        let view = PlaceDetailHeaderComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bottomView: PlaceDetailReservationComponent = {
        let view = PlaceDetailReservationComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        viewArray.removeAll()
        viewArray.append(DynamicListViewData(view: carousel, constraints: ConstantConstraintData()))
        viewArray.append(DynamicListViewData(view: headerView, constraints: ConstantConstraintData(leadingConstant: 20, trailingConstant: -20, topConstant: 10)))
        dynamicListView = DynamicListView(frame: .zero, views: viewArray, bottomConstant: 0)
        dynamicListView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dynamicListView)

        NSLayoutConstraint.activate([
            dynamicListView.topAnchor.constraint(equalTo: topAnchor),
            dynamicListView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dynamicListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dynamicListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            carousel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30)
        ])
    }

    private func setupViews() {
        addSubview(scrollView)
        addSubview(bottomView)
        carousel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {

        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        containerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().inset(-100)
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(UIScreen.main.bounds.height + 200)
        }

        carousel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width - 30)
        }

        headerView.snp.makeConstraints { make in
            make.top.equalTo(carousel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(20)
        }

        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension PlacesDetailView {
    func confgiure(with model: Place) {
        self.cellData = model
        carousel.setData(data: CarouselComponentData(imageURLs: model.placeImages, cornerRadius: false, isMainPage: false))
        headerView.setData(data: PlaceDetailHeaderComponentData(placeDetailTitle: model.placeName, placeDetailLocation: model.placeLocation, placeDetailRate: "\(model.placeRank)"))
        bottomView.setData(data: PlaceDetailReservationComponentData(placePrice: model.placePrice, placeDate: model.placeDate))
    }
}
