//
//  CategoryCellComponentCell.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import UIKit
import SnapKit

final class CategoryCellComponentCell : UICollectionViewCell {
    static let identifier = "CategoryCellComponentCell"

    override var isSelected: Bool {
        didSet {
            categoryImageView.tintColor = isSelected ? UIColor.black : UIColor.gray
            categoryTitle.textColor = isSelected ? UIColor.black : UIColor.gray
            underlineBarView.isHidden = isSelected ? false : true
        }
    }

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

    lazy var underlineBarView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        return view
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
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryTitle)
        contentView.addSubview(underlineBarView)
    }

    private func setupLayout() {

        categoryImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.height.equalTo(contentView.bounds.size.height - 60)
            make.centerX.equalToSuperview()
            make.width.equalTo(contentView.bounds.size.width - 20)
        }
        categoryTitle.snp.makeConstraints { make in
            make.top.equalTo(categoryImageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview()
        }
        underlineBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(2)
            make.width.equalToSuperview()
        }
    }
}

extension CategoryCellComponentCell {
    func configure(with model: CategoryCellComponentData) {
        categoryImageView.image = UIImage(systemName: model.image)
        categoryTitle.text = model.title
    }
}

