//
//  FeedbackView.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import UIKit

class FeedbackView: UIView  {
    let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        label.text = NSLocalizedString("helpMe", comment: "")
        return label
    }()
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.systemGray.cgColor
        textView.layer.borderWidth = 1
        textView.autocorrectionType = .no
        return textView
    }()
    let sendButton: UIButton = {
        let sendButton = UIButton(type: .system)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setTitle(NSLocalizedString("send", comment: ""), for: .normal)
        sendButton.setTitleColor(.systemBackground, for: .normal)
        sendButton.backgroundColor = .systemBlue
        sendButton.clipsToBounds = true
        sendButton.layer.cornerRadius = 20
        return sendButton
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
        addSubview(textView)
        addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 30),
            textView.heightAnchor.constraint(equalToConstant: 100),
            
            sendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            sendButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 30),
            sendButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
