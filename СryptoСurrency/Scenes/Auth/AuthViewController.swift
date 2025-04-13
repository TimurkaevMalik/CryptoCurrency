//
//  AuthViewController.swift
//  Сryptocurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private var vm: AuthViewModelProtocol
    
    private lazy var loginButton = LoginButton()
    private lazy var robotImageView = UIImageView(image: .robot)
    private lazy var loginTextField = AuthTextField(type: .login)
    private lazy var passwordTextField = AuthTextField(type: .password)
    
    init(viewModel: AuthViewModelProtocol) {
        vm = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypWhiteMedium
        setupUI()
        bindViewModel()
    }
    
    private func bindViewModel() {
        vm.onAuthSuccess = { [weak self] in
            guard let self else { return }
            self.showTabBarController()
        }
        
        vm.onAuthFailure = { [weak self] message in
            guard let self else { return }
            self.showErrorAlert(message: message)
        }
    }
    
    private func setupUI() {
        setupLoginButton()
        setupPasswordTextField()
        setupLoginTextField()
        setupRobotImage()
    }
    
    private func setupLoginButton() {
        loginButton.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.didTapLoginButton()
            },
            for: .touchUpInside)
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin)
        ])
    }
    
    private func setupPasswordTextField() {
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -25),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin)
        ])
    }
    
    private func setupLoginTextField() {
        view.addSubview(loginTextField)
        
        NSLayoutConstraint.activate([
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -15),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin)
        ])
    }
    
    private func setupRobotImage() {
        robotImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(robotImageView)
        robotImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            robotImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            robotImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            robotImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            robotImageView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width)
        ])
    }
}

private extension AuthViewController {
    func didTapLoginButton() {
        let login = loginTextField.text
        let password = passwordTextField.text
        
        vm.validateCredentials(login: login, password: password)
    }
    
    func showTabBarController() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            window.rootViewController = TabBarController()
        }
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(
            title: "Ошибка",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Повторить", style: .default))
        alert.addAction(UIAlertAction(title: "Отменить", style: .destructive) { [weak self] _ in
            guard let self else { return }
            
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        })
        
        present(alert, animated: true)
    }
}
