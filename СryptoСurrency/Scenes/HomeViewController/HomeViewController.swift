//
//  HomeViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var titleLabel = UILabel()
    private lazy var affiliateProgramLabel = UILabel()
    
    private lazy var trendContainer = UIView()
    private lazy var cubeImageView = UIImageView()
    
    private lazy var menuButton: MenuButton = {
        MenuButton(actions: getMenuButtonActions())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypPink
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupTitleLabel()
        setupMenuButton()
        setupTrendContainer()
        setupCubeImageView()
        setupAffiliateProgramLabel()
        
        setViewsPositionZ()
    }
    
    private func setViewsPositionZ() {
        view.sendSubviewToBack(cubeImageView)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Home"
        titleLabel.font = .title
        titleLabel.textColor = .ypWhite
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupAffiliateProgramLabel() {
        affiliateProgramLabel.text = "Affiliate program"
        affiliateProgramLabel.font = .affiliateProgram
        affiliateProgramLabel.textColor = .ypWhite
        
        affiliateProgramLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(affiliateProgramLabel)
        
        NSLayoutConstraint.activate([
            affiliateProgramLabel.topAnchor.constraint(equalTo: cubeImageView.topAnchor, constant: 25),
            affiliateProgramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .defaultMargin),
            affiliateProgramLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupMenuButton() {
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.defaultMargin),
            menuButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    private func setupTrendContainer() {
        trendContainer.backgroundColor = .ypWhiteGhost
        
        trendContainer.layer.cornerRadius = 40
        trendContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        trendContainer.layer.masksToBounds = true
        
        view.addSubview(trendContainer)
        trendContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trendContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 258),
            trendContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            trendContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trendContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupCubeImageView() {
        cubeImageView.image = .cube
        view.addSubview(cubeImageView)
        cubeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cubeImageView.topAnchor.constraint(equalTo: trendContainer.topAnchor, constant: -157),
            cubeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            cubeImageView.heightAnchor.constraint(equalToConstant: 242),
        ])
    }
}

private extension HomeViewController {
    func getMenuButtonActions() -> [UIAction] {
        let logoutAction = UIAction(title: "Выйти", image: .bin) { [weak self] _ in
            guard let self else { return }
            
            AuthService.shared.logout()
            self.showAuthViewController()
        }
        
        let updateAction = UIAction(title: "Обновить", image: .rocket) { _ in
            print("updateAction")
        }
        
        return [logoutAction, updateAction]
    }
    
    func showAuthViewController() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            let viewModel = AuthViewModel(authService: AuthService.shared)
            window.rootViewController = AuthViewController(viewModel: viewModel)
        }
    }
}
