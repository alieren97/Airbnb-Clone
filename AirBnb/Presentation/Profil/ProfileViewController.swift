//
//  ProfileViewController.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit

class ProfilViewController: UIViewController {

    var viewModel: ProfileViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    private let profilView = ProfilView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = profilView
        profilView.delegate = self
    }
}

extension ProfilViewController: ProfileViewDelegate {
    func didTapped(type: NavigationViewTypes) {
        switch type {
        case .personalInformation:
            print("personalInformation")
        case .taxes:
            print("taxes")
        }
    }
}

extension ProfilViewController: ProfileViewModelDelegate {
    func handleViewModelOutput(_ output: ProfileViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        }
    }
}
