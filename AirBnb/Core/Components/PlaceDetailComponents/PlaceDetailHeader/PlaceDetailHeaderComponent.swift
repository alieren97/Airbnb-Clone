//
//  PlaceDetailHeader.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 24.03.2023.
//

import UIKit
import SnapKit

class PlaceDetailHeaderComponent: DataBasedComponentView<PlaceDetailHeaderComponentData> {

    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()

    override func addMajorViews() {
        super.addMajorViews()
        addSubviews()
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        titleLabel.text = data.placeDetailTitle
        rateLabel.text = data.placeDetailRate
        locationLabel.text = data.placeDetailLocation
    }

    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(rateLabel)
        containerView.addSubview(locationLabel)
        containerView.addSubview(divider)

        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.leading.equalToSuperview()
        }

        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }

        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(rateLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }

        divider.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }

    }
}
