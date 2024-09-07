//
//  MusicListCellView.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 04.09.2024.
//

import Foundation
import UIKit
import Kingfisher

class MusicListCellView: UITableViewCell {
    let authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(authorName)
        
        addSubview(authorImageView)
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            authorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            authorImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            authorImageView.heightAnchor.constraint(equalToConstant: 80),
            authorImageView.widthAnchor.constraint(equalToConstant: 80),
            
            stack.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 12),
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stack.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func configure(_ musicModel: Music) {
        self.authorImageView.kf.setImage(with: URL(string: musicModel.urlImage))
        self.title.text = musicModel.title
        self.authorName.text = musicModel.author
    }
}
