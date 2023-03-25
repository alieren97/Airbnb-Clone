//
//  PlacesView.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation
import UIKit
import SnapKit
import MapKit

final class PlacesView: UIView {

    private var dynamicListView: DynamicListView!
    private var viewArray = [DynamicListViewData]()

    lazy var searchView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 2
        view.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.addSubview(searchImageView)
        view.addSubview(searchLabel)
        view.addSubview(searchFilterImageView)
        return view
    }()

    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "magnifyingglass")
        return imageView
    }()

    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Nereye?"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()

    private lazy var searchFilterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "line.3.horizontal.decrease.circle")
        return imageView
    }()

    lazy var categoryComponent: CategoryCellComponent = {
        let component = CategoryCellComponent(frame: .zero)
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()

    lazy var placesTableView: UITableView = {
        let tv = UITableView()
        tv.register(PlacesTableViewCell.self, forCellReuseIdentifier: PlacesTableViewCell.identifier)
        tv.separatorStyle = .none
        tv.rowHeight = UIScreen.main.bounds.width + 100
        tv.alpha = 1
        return tv
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        viewArray.removeAll()
        viewArray.append(DynamicListViewData(view: searchView, constraints: ConstantConstraintData(leadingConstant: 20, trailingConstant: -20, topConstant: 0)))
        viewArray.append(DynamicListViewData(view: categoryComponent, constraints: ConstantConstraintData(topConstant: 10)))
        viewArray.append(DynamicListViewData(view: placesTableView, constraints: ConstantConstraintData()))
        dynamicListView = DynamicListView(frame: .zero, views: viewArray, bottomConstant: 0)
        dynamicListView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dynamicListView)
        searchBarComponentsLayoutsSetupUp()

        NSLayoutConstraint.activate([
            dynamicListView.topAnchor.constraint(equalTo: topAnchor),
            dynamicListView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dynamicListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dynamicListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            categoryComponent.heightAnchor.constraint(equalToConstant: 100),
            placesTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 160)
        ])
    }

    private func searchBarComponentsLayoutsSetupUp() {
        searchImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }

        searchLabel.snp.makeConstraints { make in
            make.leading.equalTo(searchImageView.snp.trailing).offset(10)
            make.width.height.equalToSuperview()
        }

        searchFilterImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }
    }
}
