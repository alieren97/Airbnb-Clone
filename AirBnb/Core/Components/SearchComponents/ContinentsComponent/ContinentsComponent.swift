//
//  ContinentsComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import UIKit
import SnapKit

class ContinentsComponent: DataBasedComponentView<ContinentsComponentData> {

    var continentList: [Continent] = []

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: CarouselLayout()
    )

    override func addMajorViews() {
        super.addMajorViews()
        addSubviews()
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        continentList = data.continents
    }

    func addSubviews() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ContinentsCollectionViewCell.self, forCellWithReuseIdentifier: ContinentsCollectionViewCell.identifier)
        addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }

    }
}

extension ContinentsComponent: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return continentList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = continentList[indexPath.row]
        guard let cell: ContinentsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContinentsCollectionViewCell.identifier, for: indexPath) as? ContinentsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.isSelected = true
        cell.configure(title: item.title, imgTitle: item.continentImage)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150,  height: 150)
    }
}
