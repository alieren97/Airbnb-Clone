//
//  MainTabBarController.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }

    func configureViewControllers() {
        let feed = PlacesViewController()
        let feedViewModel = PlacesViewModel()
        feed.viewModel = feedViewModel
        let nav1 = templateNavigationController(image:  UIImage(systemName: "magnifyingglass")!, title: "Kesfedin", rootViewController: feed)


//        let explore = FavoritesViewController()
//        let nav2 = templateNavigationController(image:  UIImage(systemName: "heart")!, title: "Favoriler", rootViewController: explore)
//
//        let notifications = TripsViewController()
//        let nav3 = templateNavigationController(image:  UIImage(systemName: "drop.triangle")!, title: "Seyahatlar", rootViewController: notifications)
//
//        let conversations = MessagesViewController()
//        let nav4 = templateNavigationController(image:  UIImage(systemName: "message")!, title: "Gelen Kutusu", rootViewController: conversations)
//
//        let profile = Auth.auth().currentUser != nil ? ProfilViewController() : AuthController()
//        let nav5 = templateNavigationController(image:  UIImage(systemName: "person.circle")!, title: "Profil", rootViewController: profile)
        let profile = ProfilViewController()
        let profileViewModel = ProfileViewModel()
        profile.viewModel = profileViewModel
        let nav5 = templateNavigationController(image:  UIImage(systemName: "person.circle")!, title: "Profil", rootViewController: profile)
        viewControllers = [nav1, nav5]
    }

    func templateNavigationController(image: UIImage,title: String, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        nav.navigationBar.barTintColor = .white
        return nav
    }
}
