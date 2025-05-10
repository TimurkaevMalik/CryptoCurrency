//
//  LoaderView.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import UIKit

final class LoaderView: UIView {
    
    private let indicatorContainer = UIView()
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.alpha = 0.9
        
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .ypWhite
        
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        indicatorContainer.backgroundColor = .ypWhiteMedium.withAlphaComponent(0.6)
        indicatorContainer.layer.cornerRadius = 8
        indicatorContainer.layer.masksToBounds = true
        
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        indicatorContainer.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurView)
        addSubview(indicatorContainer)
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            indicatorContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorContainer.heightAnchor.constraint(equalToConstant: 64),
            indicatorContainer.widthAnchor.constraint(equalToConstant: 64),
            
            activityIndicator.centerXAnchor.constraint(equalTo: indicatorContainer.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: indicatorContainer.centerYAnchor)
        ])
    }
}

extension LoaderView {
    func startAnimating() {
        isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        isHidden = true
        activityIndicator.stopAnimating()
    }
}
