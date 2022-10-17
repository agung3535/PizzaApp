//
//  MenuCollectionViewCell.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectionViewCell"
    
    private let imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleMenu: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageIcon)
        addSubview(titleMenu)
        setupView()
        imageIcon.setContentHuggingPriority(.required, for: .vertical)
        imageIcon.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    func setupData(data: MenuModel) {
        titleMenu.text = data.name
        imageIcon.image = UIImage(named: data.icon)
    }
    
    func setupPinggiran(data: Pinggiran) {
        titleMenu.text = data.typePinggiran
        imageIcon.image = UIImage(named: "pizza-slices")
    }
    
    private func setupView() {
        
        NSLayoutConstraint.activate([
            imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageIcon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageIcon.heightAnchor.constraint(equalTo: imageIcon.widthAnchor, multiplier: 1.0),
//
            titleMenu.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleMenu.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            titleMenu.topAnchor.constraint(equalTo: imageIcon.bottomAnchor, constant: 0),
            titleMenu.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
