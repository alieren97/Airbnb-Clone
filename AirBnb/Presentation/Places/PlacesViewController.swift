//
//  PlacesViewController.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit

class PlacesViewController: UIViewController {

    private let mainView = PlacesView()
    
    var viewModel: PlacesViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    private var places: [Place] = []
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewModel.loadPlaces()
        viewModel.loadCategories()
        setupTableView()
        searchViewTapped()
    }
}


extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {

    @objc func backButtonDidTapped() {
        //        searchView.unselectIndex()
        navigationController?.tabBarController?.tabBar.isHidden = false
    }

    func setupTableView() {
        mainView.placesTableView.delegate = self
        mainView.placesTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PlacesTableViewCell = tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.identifier) as? PlacesTableViewCell else {
            return UITableViewCell()
        }
        self.index = indexPath.row
        cell.selectionStyle = .none
        cell.configureCell(place: places[indexPath.row])
        return cell

    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = places[indexPath.row]
        self.index = indexPath.row

        navigationController?.tabBarController?.tabBar.isHidden = true
        let detailViewController = PlacesDetailViewController()
        detailViewController.placeDetailView.confgiure(with: place)
        navigationController?.pushViewController(detailViewController, animated: true)

        //        searchView.searchDetailView.confgiure(with: place)
        //        searchView.selectIndex()
    }
}


extension PlacesViewController {
    func searchViewTapped() {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped))
        gesture.numberOfTapsRequired = 1
        mainView.searchView.addGestureRecognizer(gesture)
    }

    @objc func targetViewDidTapped() {
        let sv = SearchViewController()
        let viewModel = SearchViewModel()
        sv.viewModel = viewModel
        navigationController?.pushViewController(sv, animated: true)
    }
}


extension PlacesViewController: PlacesViewModelDelegate {
    func handleViewModelOutput(_ output: PlacesViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .placesList(let list):
            self.places = list
            mainView.placesTableView.reloadData()
        case .categoryList(let list):
            mainView.categoryComponent.setData(data: list)
        }
    }
}
