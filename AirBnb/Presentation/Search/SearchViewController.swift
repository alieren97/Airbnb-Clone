//
//  SearchViewController.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 25.03.2023.
//

import Foundation
import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    var popView: Bool = false

    var viewModel: SearchViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.tabBarController?.tabBar.isHidden = true
        viewModel.loadContinets()
        let backbıtem = UIBarButtonItem(customView: searchView.closeButton)
        searchView.closeButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = backbıtem
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func handleViewModelOutput(_ output: SearchViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .continentList(let array):
            searchView.configure(continets: array)
        }
    }
}
