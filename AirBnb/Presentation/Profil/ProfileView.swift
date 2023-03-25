//
//  ProfileView.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation
import UIKit
import SnapKit

protocol ProfileViewDelegate: AnyObject {
    func didTapped(type: NavigationViewTypes)
}

final class ProfilView: UIView {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(scrollableStackView)
        view.backgroundColor = .white
        return view
    }()

    private lazy var scrollableStackView: ScrollableStackView = {
        let scrollableStackView = ScrollableStackView()
        scrollableStackView.translatesAutoresizingMaskIntoConstraints = false
        return scrollableStackView
    }()

    private lazy var profileHeaderView: SectionHeaderViewComponent = {
        let view = SectionHeaderViewComponent(frame: .zero, data: SectionHeaderViewComponentData(title: "Profil", titleFont: 28))
        return view
    }()

    private lazy var profilePhotoNavigationComponent: ProfilePhotoNavigationComponent = {
        let view = ProfilePhotoNavigationComponent(frame: .zero, data: ProfilePhotoNavigationComponentData(name: "Ali Eren", userImage: "ali_eren"))
        return view
    }()

    private lazy var firstSectionHedader: SectionHeaderViewComponent = {
        let view = SectionHeaderViewComponent(frame: .zero, data: SectionHeaderViewComponentData(title: "Ayarlar", titleFont: 20))
        return view
    }()

    private lazy var personalInformationView: NavigationViewComponent = {
        let view = NavigationViewComponent(frame: .zero, data: NavigationViewComponentData(type: .personalInformation, title: "Kisisel Bilgiler", titleImage: "person.circle"))
        view.delegate = self
        return view
    }()

    private lazy var paymentThatYouMadeView: NavigationViewComponent = {
        let view = NavigationViewComponent(frame: .zero, data: NavigationViewComponentData(type: .personalInformation, title: "Yaptığınız ve aldığınız ödemeler", titleImage: "house"))
        view.delegate = self
        return view
    }()

    private lazy var taxesView: NavigationViewComponent = {
        let view = NavigationViewComponent(frame: .zero, data: NavigationViewComponentData(type: .taxes, title: "Vergiler", titleImage: "house"))
        view.delegate = self
        return view
    }()

    private lazy var loginAndSecurityView: NavigationViewComponent = {
        let view = NavigationViewComponent(frame: .zero, data: NavigationViewComponentData(type: .taxes, title: "Giriş yapma ve güvenlik", titleImage: "house"))
        view.delegate = self
        return view
    }()

    private lazy var secondSectionHeader: SectionHeaderViewComponent = {
        let view = SectionHeaderViewComponent(frame: .zero, data: SectionHeaderViewComponentData(title: "Ev Sahipliği", titleFont: 20))
        return view
    }()

    private lazy var houseOwnerModeView: NavigationViewComponent = {
        let view = NavigationViewComponent(frame: .zero, data: NavigationViewComponentData(type: .personalInformation, title: "Ev sahipliği moduna geç", titleImage: "house"))
        view.delegate = self
        return view
    }()

    weak var delegate: ProfileViewDelegate?

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(containerView)
        scrollableStackView.stackView.addArrangedSubview(profileHeaderView)
        scrollableStackView.stackView.addArrangedSubview(profilePhotoNavigationComponent)
        scrollableStackView.stackView.addArrangedSubview(firstSectionHedader)
        scrollableStackView.stackView.addArrangedSubview(personalInformationView)
        scrollableStackView.stackView.addArrangedSubview(paymentThatYouMadeView)
        scrollableStackView.stackView.addArrangedSubview(taxesView)
        scrollableStackView.stackView.addArrangedSubview(loginAndSecurityView)
        scrollableStackView.stackView.addArrangedSubview(secondSectionHeader)
        scrollableStackView.stackView.addArrangedSubview(houseOwnerModeView)
    }

    private func setupLayout() {

        containerView.snp.makeConstraints {  $0.edges.equalToSuperview() }

        scrollableStackView.snp.makeConstraints { make in
            make.bottom.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}

extension ProfilView: NavigationComponentDelegate {
    func buttonTapped(type: NavigationViewTypes) {
        delegate?.didTapped(type: type)
    }
}
