//
//  HomeViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var titleView = UILabel()
    
    private lazy var menuButton: MenuButton = {
        MenuButton(actions: getMenuButtonActions())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypPink
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupTitleView()
        setupMenuButton()
    }
    
    private func setupTitleView() {
        titleView.text = "Home"
        titleView.font = .title
        titleView.textColor = .ypWhite
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleView)
        
        
        NSLayoutConstraint.activate([
            titleView.heightAnchor.constraint(equalToConstant: 48),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupMenuButton() {
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin),
            menuButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor)
        ])
    }
    
    private func getMenuButtonActions() -> [UIAction] {
        let logoutAction = UIAction(title: "Выйти", image: .bin) { _ in
            AuthService.shared.logout()
        }
        
        let updateAction = UIAction(title: "Обновить", image: .rocket) { _ in
            print("updateAction")
        }
        
        return [logoutAction, updateAction]
    }
}
