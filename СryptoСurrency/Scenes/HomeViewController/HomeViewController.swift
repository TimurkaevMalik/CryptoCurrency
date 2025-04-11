//
//  HomeViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var titleView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypPink
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupTitleView()
    }
    
    private func setupTitleView() {
        titleView.text = "Home"
        titleView.font = .title
        titleView.textColor = .ypWhite
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleView)
        
        
        NSLayoutConstraint.activate([
            titleView.heightAnchor.constraint(equalToConstant: 48),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
}
