//
//  ScheduleView.swift
//  Сryptoсurrency
//
//  Created by Malik Timurkaev on 12.04.2025.
//

import UIKit

final class ScheduleView: UIView {
    
    var onScheduleChange: ((Schedule) -> Void)?
    
    ///Вычисляю допустимую ширину для каждой кнопки
    private lazy var availableButtonWidth: CGFloat = {
        print(bounds)
        return bounds.width / 5
    }()
    
    ///Подсвечивает выбранный Schedule
    private let scheduleIndicator = UIView()
    private let HStackView = UIStackView()
    private var buttons: [UIButton] = []
    
    private let dayButton: UIButton = {
        let button = UIButton()
        button.setTitle("24H", for: .normal)
        
        return button
    }()
    
    private let weakButton: UIButton = {
        let button = UIButton()
        button.setTitle("1W", for: .normal)
        
        return button
    }()
    
    private let yearButton: UIButton = {
        let button = UIButton()
        button.setTitle("1Y", for: .normal)
        
        return button
    }()
    
    private let allButton: UIButton = {
        let button = UIButton()
        button.setTitle("ALL", for: .normal)
        
        return button
    }()
    
    private let pointButton: UIButton = {
        let button = UIButton()
        button.setTitle("Point", for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtons()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButtons() {
        buttons = [dayButton, weakButton, yearButton, allButton, pointButton]
        
        buttons.enumerated().forEach { (index, button) in
            let color: UIColor = index == 0 ? .ypBlackEclipse : .ypGray
            button.setTitleColor(color, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = .scheduleButton
            button.tag = index
            
            button.addAction(
                UIAction { [weak self] _ in
                    guard let self else { return }
                    self.buttonTapped(button)
                },
                for: .touchUpInside)
            ///TODO: element.addAction
            HStackView.addArrangedSubview(button)
        }
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        scheduleIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .ypBlueGraylish
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        HStackView.axis = .horizontal
        HStackView.distribution = .fillEqually
        HStackView.alignment = .fill
        
        addSubview(HStackView)
        addSubview(scheduleIndicator)
        
        NSLayoutConstraint.activate([
            HStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            HStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            HStackView.topAnchor.constraint(equalTo: topAnchor),
            HStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func buttonTapped(_ sender: UIButton) {
        guard let schedule = Schedule(rawValue: sender.tag) else { return }
        onScheduleChange?(schedule)
        
        buttons.forEach { button in
            let color: UIColor = button == sender ? .ypBlackEclipse : .ypGray
            button.setTitleColor(color, for: .normal)
        }
        
        changeIndicatorPosition()
    }
    
    private func changeIndicatorPosition() {
    }
}

extension ScheduleView {
    enum Schedule: Int {
        case day = 0
        case weak = 1
        case year = 2
        case all = 3
        case point = 4
    }
}
