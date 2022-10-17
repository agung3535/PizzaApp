//
//  DescriptionCollectionViewCell.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DescriptionCollectionViewCell"
    
    private let imgFood: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let foodName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let descFood: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraint()
    }
    
    func setupData(data: PizzaMenu) {
        imgFood.image = UIImage(named: data.image)
        imgFood.backgroundColor = #colorLiteral(red: 0.846364677, green: 0.846364677, blue: 0.8463647366, alpha: 1)
        foodName.text = data.name
        descFood.text = data.description
    }
    
    private func setupConstraint() {
        addSubview(imgFood)
        addSubview(foodName)
        addSubview(descFood)
        
        NSLayoutConstraint.activate([
            
            //image
            imgFood.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgFood.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imgFood.trailingAnchor.constraint(equalTo: trailingAnchor),
            imgFood.bottomAnchor.constraint(equalTo: foodName.topAnchor, constant: -5),
            imgFood.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
            imgFood.heightAnchor.constraint(equalToConstant: contentView.frame.size.width / 3),
            
            
            //title
            foodName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            foodName.topAnchor.constraint(equalTo: imgFood.bottomAnchor, constant: -15),
            foodName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            foodName.bottomAnchor.constraint(equalTo: descFood.topAnchor, constant: -5),
            //desc
            descFood.leadingAnchor.constraint(equalTo: foodName.leadingAnchor),
            descFood.trailingAnchor.constraint(equalTo: foodName.trailingAnchor),
//            descFood.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
