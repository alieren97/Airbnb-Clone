//
//  SearchView.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import Foundation
import UIKit
import SnapKit

struct Continent {
    let continentImage: String
    let title: String
}

final class SearchView: UIView {

    var continents: [Continent]?

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.addSubview(closeButton)
        view.addSubview(searchContainerView)
        view.addSubview(dateView)
        view.addSubview(guestsView)
        view.addSubview(bottomContainerView)
        return view
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.tintColor = .black
        return button
    }()

     lazy var searchContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        view.addSubview(whereToGoLabel)
        view.addSubview(searchTextFieldComponent)
        view.addSubview(continentsComponent)
        return view
    }()

    lazy var whereToGoLabel: UILabel = {
        let label = UILabel()
        label.text = "Nereye?"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    lazy var searchTextFieldComponent: SearchTextFieldComponent = {
        let tf = SearchTextFieldComponent()
        tf.setData(data: SearchTextFieldComponentData(placeHolder: "Gidilecek yerleri arayın", textFieldImage: "magnifyingglass").setTextFieldEnabled(by: false))
        return tf
    }()

    let continentsComponent: ContinentsComponent = {
        let cv = ContinentsComponent()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

     lazy var dateView: UIView = {
       let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        return view
    }()

     lazy var guestsView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        return view
    }()

    lazy var bottomContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.addSubview(clearAllLabel)
        view.addSubview(reserveButtonView)
        return view
    }()

    private lazy var reserveButtonView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 10
        view.addSubview(reservationText)
       return view
    }()

    private lazy var reservationText: UILabel = {
        let label = UILabel()
        label.text = "Rezerve edin"
        label.textColor = .white
        return label
    }()

    private lazy var clearAllLabel: UILabel = {
       let label = UILabel()
        label.text = "Hepsini temizle"
        return label
    }()

    lazy var pastSearchTableView: UITableView = {
        let tv = UITableView()
        tv.register(PastSearchTableViewCell.self, forCellReuseIdentifier: PastSearchTableViewCell.identifier)
        tv.rowHeight = UIScreen.main.bounds.width + 100
        return tv
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews(){
        addSubview(containerView)
    }

     private func setupLayouts(){
        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }

        closeButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
            make.height.width.equalTo(40)
        }

        searchContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(125)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(UIScreen.main.bounds.width)
        }

        whereToGoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }

         searchTextFieldComponent.snp.makeConstraints { make in
            make.top.equalTo(whereToGoLabel.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(10)
        }

         continentsComponent.snp.makeConstraints { make in
            make.top.equalTo(searchTextFieldComponent.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(250)
        }
        dateView.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(10)
            make.height.equalTo(100)
        }
        guestsView.snp.makeConstraints { make in
            make.top.equalTo(dateView.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(10)
            make.height.equalTo(100)
        }

        bottomContainerViewLayoutSetup()
    }

    func bottomContainerViewLayoutSetup() {

        bottomContainerView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }

        clearAllLabel.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width / 2 - 40)
            make.leading.equalToSuperview().inset(30)
            make.top.bottom.equalToSuperview().inset(30)
        }

        reserveButtonView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(22)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(UIScreen.main.bounds.width / 2 - 40)
        }

        reservationText.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }

    func configure(continets: [Continent]) {
        self.continentsComponent.setData(data: ContinentsComponentData(continents: continets))
    }
}
