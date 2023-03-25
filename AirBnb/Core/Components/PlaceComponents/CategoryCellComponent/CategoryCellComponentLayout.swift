//
//  CategoryCellComponentLayout.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import UIKit

final class CategoryCellComponentLayout: UICollectionViewFlowLayout {
    // perform the setup for the layout
    override init() {
        super.init()
        self.minimumInteritemSpacing = 0
        self.scrollDirection = .horizontal
        self.minimumLineSpacing = 10
        self.sectionInset = .zero
        self.itemSize.width = 80
        self.itemSize.height = 100
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Tells the layout object to update the current layout.
    override func prepare() {
        super.prepare()
        if let collectionView = collectionView {
            itemSize = collectionView.frame.size
        }
    }

    // Asks the layout object if the new bounds require a layout update.
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard itemSize != newBounds.size else { return false }
        itemSize = newBounds.size
        return true
    }
}
