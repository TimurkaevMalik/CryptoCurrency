//
//  AuthViewController.swift
//  Сryptocurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private lazy var loginTextField = AuthTextField(type: .login)
    private lazy var passwordTextField = AuthTextField(type: .password)

    private lazy var loginButton: LoginButton = {
        let button = LoginButton(action: didTapLoginButton)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypWhiteMedium
        setupLoginButton()
        setupPasswordTextField()
        setupLoginTextField()
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
    
    private func setupPasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -25),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
    }
    
    private func setupLoginTextField() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        
        NSLayoutConstraint.activate([
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -15),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
    }
    
    private func didTapLoginButton() {
        print("didTapLoginButton")
    }
}
