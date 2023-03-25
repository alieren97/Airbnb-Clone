//
//  SearchTextFieldComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import UIKit
import SnapKit

class SearchTextFieldComponent: DataBasedComponentView<SearchTextFieldComponentData> {

    lazy var searchTextField: UITextField = {
       let textField = UITextField()
        textField.delegate = self
        return textField
    }()

    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func addMajorViews() {
        super.addMajorViews()
        addSubviews()
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        searchTextField.placeholder = data.placeHolder
        searchImageView.image = UIImage(systemName: data.textFieldImage ?? "")
        searchTextField.isEnabled = data.isTextFieldEnabled ?? false
    }

    private func addSubviews() {
        addSubview(searchImageView)
        addSubview(searchTextField)
        layer.masksToBounds = true
        clipsToBounds = false
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray3.cgColor

        heightAnchor.constraint(equalToConstant: 60)

        searchImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        searchTextField.snp.makeConstraints { make in
            make.leading.equalTo(searchImageView.snp.trailing).offset(20)
            make.top.bottom.equalToSuperview().inset(20)
        }
    }
}

extension SearchTextFieldComponent: UITextFieldDelegate {

}
