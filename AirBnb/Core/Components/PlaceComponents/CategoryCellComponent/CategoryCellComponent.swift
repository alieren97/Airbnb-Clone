//
//  CategoryCellComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import UIKit
import SnapKit

class CategoryCellComponent: DataBasedComponentView<CategoryCellComponentListData> {

    var list: [CategoryCellComponentData] = []
    var selectedIndex: Int = 0
    var currentIndex: CGFloat = 0.0

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: CategoryCellComponentLayout()
    )

    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()

    override func addMajorViews() {
        super.addMajorViews()
        addSubviews()
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        list = data.list
    }

    private func addSubviews() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
        collectionView.register(CategoryCellComponentCell.self, forCellWithReuseIdentifier: CategoryCellComponentCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    private func selectNext() {
        selectItem(at: Int(currentIndex) + 1)
    }

    private func selectItem(at index: Int) {
        guard let data = returnData() else { return }
        let index = data.list.count > index ? index : 0
        guard selectedIndex != index else { return }
        selectedIndex = index
        collectionView.scrollToItem(at: IndexPath(item: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)
//        collectionView.selectItem(at: IndexPath(item: selectedIndex, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension CategoryCellComponent: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.selectedIndex = indexPath.row
        let index = list[indexPath.row]
        guard let cell: CategoryCellComponentCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCellComponentCell.identifier, for: indexPath) as? CategoryCellComponentCell else {
            return UICollectionViewCell()
        }
        cell.isSelected = true
        cell.configure(with: index)
        return cell
    }
}

extension CategoryCellComponent: UICollectionViewDelegate { }

extension CategoryCellComponent: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}
