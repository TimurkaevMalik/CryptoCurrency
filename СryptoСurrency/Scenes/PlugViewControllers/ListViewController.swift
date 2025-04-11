//
//  ListViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class ListViewController: UIViewController {
    
    private lazy var titleView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypWhiteGhost
        setupTitleView()
    }
    
    private func setupTitleView() {
        titleView.text = "List"
        titleView.font = .loginButton
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleView)
        
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
