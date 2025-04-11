//
//  MenuButton.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 11.04.2025.
//

import UIKit

final class MenuButton: UIButton {
    
    private let actions: [UIAction]
    
    init(actions: [UIAction]) {
        self.actions = actions
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .ypWhite.withAlphaComponent(0.8)
        layer.cornerRadius = 24
        layer.masksToBounds = true
        setImage(.ellipsis, for: .normal)
        let size: CGFloat = 48
        let anchorView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 60))
        addSubview(anchorView)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        menu = UIMenu(children: actions)
        showsMenuAsPrimaryAction = true
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size),
            widthAnchor.constraint(equalToConstant: size)
        ])
    }
    
    override func menuAttachmentPoint(for configuration: UIContextMenuConfiguration) -> CGPoint {
        
        let original = super.menuAttachmentPoint(for: configuration)
        return CGPoint(x: original.x, y: original.y + 8)
    }
}
