//
//  TabBarController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let homeViewController: HomeViewController
    private let graphViewController = GraphViewController()
    private let walletViewController = WalletViewController()
    private let listViewController = ListViewController()
    private let profileViewController = ProfileViewController()
    
    init() {
        let homeViewModel = HomeViewModel(cryptoService: CryptoService())
        homeViewController = HomeViewController(viewModel: homeViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        addTabBarItems()
    }
    
    private func addTabBarItems(){
        
        tabBar.backgroundColor = .ypWhite
        tabBar.tintColor = .ypBlack
        tabBar.unselectedItemTintColor = .ypGrayMedium
        
        let navigationController = UINavigationController()
        
        homeViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: .home,
            selectedImage: nil)
        
        graphViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: .graph,
            selectedImage: nil)
        
        walletViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: .wallet,
            selectedImage: nil)
        
        listViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: .list,
            selectedImage: nil)
        
        profileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: .profile,
            selectedImage: nil)
        
        navigationController.viewControllers = [homeViewController]
        
        self.viewControllers = [navigationController,
                                graphViewController,
                                walletViewController,
                                listViewController,
                                profileViewController]
    }
}
