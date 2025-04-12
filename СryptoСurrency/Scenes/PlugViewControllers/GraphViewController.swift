//
//  GraphViewController.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 10.04.2025.
//

import UIKit

final class GraphViewController: UIViewController {
    
    private lazy var titleLabel = UILabel()
    private lazy var trendContainer = UIView()
    private lazy var cubeImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypPink
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupTitleLabel()
        setupTrendContainer()
        setupCubeImageView()
        
        setViewsPositionZ()
    }
    
    private func setViewsPositionZ() {
        view.sendSubviewToBack(cubeImageView)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Graph"
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
