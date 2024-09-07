//
//  RulesView.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 05.09.2024.
//

import Foundation
import UIKit

class RulesView: UIView {
    let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = NSLocalizedString("rulesTitle", comment: "")
        return label
    }()
    
    let subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 0
        subtitle.text = NSLocalizedString("rulesSubtitle", comment: "")
        return subtitle
    }()
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("ok", comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        addSubview(labelView)
        addSubview(subtitle)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            labelView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            subtitle.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 10),
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
