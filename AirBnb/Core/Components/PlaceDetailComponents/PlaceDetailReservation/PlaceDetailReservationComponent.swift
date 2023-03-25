//
//  PlaceDetailReservationComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 24.03.2023.
//

import UIKit
import SnapKit

class PlaceDetailReservationComponent: DataBasedComponentView<PlaceDetailReservationComponentData> {

    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //TODO: DO custom generic button
    private lazy var reserveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Rezerve Edin", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()

//    private lazy var reserveButtonView: UIView = {
//       let view = UIView()
//        view.backgroundColor = .systemRed
//        view.layer.cornerRadius = 10
//        view.addSubview(reservationText)
//       return view
//    }()
//
//    private lazy var reservationText: UILabel = {
//        let label = UILabel()
//        label.text = "Rezerve edin"
//        label.textColor = .white
//        return label
//    }()

    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceLabel, dateLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()

    private lazy var priceLabel: UILabel = {
       let label = UILabel()
        return label
    }()

    private lazy var dateLabel: UILabel = {
       let label = UILabel()
        return label
    }()

    override func addMajorViews() {
        super.addMajorViews()
        addSubviews()
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        priceLabel.text = "\(data.placePrice ?? 0) ₺ gece"
        dateLabel.text = data.placeDate
    }

    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(priceStackView)
        containerView.addSubview(reserveButton)

        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }

        priceStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(20)
        }

        reserveButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
    }
}
