//
//  AuthViewController.swift
//  Сryptocurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private lazy var loginButton: LoginButton = {
        let button = LoginButton(action: didTapLoginButton)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypWhiteMedium
        setupLoginButton()
    }
    
    private func setupLoginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
    }
    
    private func didTapLoginButton() {
        print("didTapLoginButton")
    }
}
