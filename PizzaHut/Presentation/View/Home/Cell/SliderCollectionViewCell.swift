//
//  SliderCollectionViewCell.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SliderCollectionViewCell"
    
    private let slideTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(slideTitle)
        setupConstraint()
        
    }
    
    func setupData(data: SlideModel) {
        slideTitle.text = data.title
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            slideTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            slideTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            slideTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            slideTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
