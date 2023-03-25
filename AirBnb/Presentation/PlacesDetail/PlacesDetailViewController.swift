//
//  PlacesDetailViewController.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import Foundation
import UIKit

final class PlacesDetailViewController: UIViewController {

    let placeDetailView = PlacesDetailView()

    var viewModel: PlacesDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = placeDetailView
        configureScrollView()
        setupNavigationBar()
    }
}

extension PlacesDetailViewController: PlacesDetailViewModelDelegate {
    func handleViewModelOutput(_ output: PlacesDetailViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        }
    }
}

extension PlacesDetailViewController: UIScrollViewDelegate {

    func configureScrollView() {
        placeDetailView.scrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y / 130
        if offset > 1 {
            offset = 1
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarUIView?.backgroundColor = color
        } else {
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
            navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarUIView?.backgroundColor = color
        }
    }
}

extension PlacesDetailViewController {
    
    func setupNavigationBar() {
        let backbıtem = UIBarButtonItem(customView: placeDetailView.backButtonn)
        let heartItem = UIBarButtonItem(customView: placeDetailView.heartButtonn)
        let shareItem = UIBarButtonItem(customView: placeDetailView.shareButtonn)

        placeDetailView.backButtonn.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        navigationController?.setNavigationBarHidden(false, animated: false)

        navigationItem.leftBarButtonItem = backbıtem
        navigationItem.rightBarButtonItems = [shareItem,heartItem]
        navigationController?.tabBarController?.tabBar.isHidden = true

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    @objc func backButtonDidTapped() {
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(true, animated: false)
                                                     navigationController?.tabBarController?.tabBar.isHidden = false
    }
}
