//
//  AuthViewController.swift
//  Сryptocurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private var viewModel: AuthViewModelProtocol
    
    private lazy var robotImageView = UIImageView(image: .robot)
    private lazy var loginTextField = AuthTextField(type: .login)
    private lazy var passwordTextField = AuthTextField(type: .password)

    private lazy var loginButton: LoginButton = {
        let button = LoginButton(action: didTapLoginButton)
        return button
    }()
    
    init(viewModel: AuthViewModelProtocol) {
        self.viewModel = viewModel
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
        viewModel.onAuthSuccess = { [weak self] in
            guard let self else { return }
            self.showTabBarController()
        }
        
        viewModel.onAuthFailure = { [weak self] message in
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
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin)
        ])
    }
    
    private func setupPasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -25),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin)
        ])
    }
    
    private func setupLoginTextField() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func didTapLoginButton() {
        let login = loginTextField.text
        let password = passwordTextField.text

        viewModel.validateCredentials(login: login, password: password)
    }
    
    private func showTabBarController() {
        print("showTabBarController")
    }
    
    private func showErrorAlert(message: String) {
           let alert = UIAlertController(
               title: "Ошибка",
               message: message,
               preferredStyle: .alert
           )
           
           alert.addAction(UIAlertAction(title: "Повторить", style: .default))
           alert.addAction(UIAlertAction(title: "Отменить", style: .destructive) { _ in
               self.loginTextField.text = ""
               self.passwordTextField.text = ""
           })
           
           present(alert, animated: true)
       }
}
