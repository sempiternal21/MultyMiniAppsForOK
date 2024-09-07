//
//  JokeView.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

class JokeView: BaseView {
    let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
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
        addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            labelView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func configure(title: String, subtitle: String? = nil) {
        self.labelView.text = title
    }
}
