//
//  View.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import UIKit

class CryptoView: UIView {
    let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(red: 60/255, green: 19/255, blue: 171/255, alpha: 1)
        return label
    }()
    let imageView: UIImageView = {
        let image = UIImage(named: "hamster2")?.scaled(with: 0.9)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("getProfit", comment: ""), for: .normal)
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
        layer.addSublayer(getBackgroundGradient())
        
        addSubview(labelView)
        addSubview(imageView)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            labelView.heightAnchor.constraint(equalToConstant: 30),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configure(_ model: CryptoModel) {
        self.labelView.text = NSLocalizedString("youBalance", comment: "") + String(model.balance) + NSLocalizedString("bitcoins", comment: "")
    }
    
    func getBackgroundGradient() -> CAGradientLayer {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let gradient = CAGradientLayer()
        let blue = UIColor(red: 180/255, green: 157/255, blue: 244/255, alpha: 1)
        let green = UIColor(red: 78/255, green: 16/255, blue: 246/255, alpha: 1)
        gradient.colors = [blue.cgColor, green.cgColor]
        gradient.locations = [0, 0.5]
        gradient.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return gradient
    }
}

extension UIImage {
    func scaled(with scale: CGFloat) -> UIImage? {
            let size = CGSize(width: floor(self.size.width * scale), height: floor(self.size.height * scale))
            UIGraphicsBeginImageContext(size)
            draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
}
