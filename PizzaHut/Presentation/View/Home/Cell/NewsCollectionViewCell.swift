//
//  NewsCollectionViewCell.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsCollectionViewCell"
    
    private let imageNews: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageNews)
        setupConstraint()
        backgroundColor = .clear
    }
    
    func setupData(data: NewsModel) {
        imageNews.image = UIImage(named: data.image)
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            imageNews.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageNews.topAnchor.constraint(equalTo: topAnchor),
            imageNews.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageNews.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
