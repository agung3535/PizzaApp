//
//  FoodMenuTableViewCell.swift
//  PizzaHut
//
//  Created by Putra on 06/10/22.
//

import UIKit

class FoodMenuTableViewCell: UITableViewCell {
    
    static let identifier = "FoodMenuTableViewCell"
    
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
    
    private let pricateLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let btnAdd: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMenu(data: PizzaMenu) {
        imgFood.image = UIImage(named: data.image)
        foodName.text = data.name
        descFood.text = data.description
        pricateLbl.text = "Rp \(data.price)"
//        pricateLbl.backgroundColor = .blue
    }
    
    private func setupConstraint() {
        addSubview(imgFood)
        addSubview(foodName)
        addSubview(descFood)
        addSubview(pricateLbl)
        addSubview(btnAdd)
//        imgFood.setContentHuggingPriority(.required, for: .horizontal)
//        imgFood.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        NSLayoutConstraint.activate([
            
            //image
            imgFood.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imgFood.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imgFood.trailingAnchor.constraint(equalTo: foodName.leadingAnchor, constant: -10),
            imgFood.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            imgFood.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 3),
            imgFood.heightAnchor.constraint(equalToConstant: contentView.frame.size.width / 3),
            
//            imgFood.heightAnchor.constraint(equalTo: imgFood.widthAnchor, multiplier: 1.0),
            
            
            //title
            foodName.leadingAnchor.constraint(equalTo: imgFood.trailingAnchor, constant: 10),
            foodName.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            foodName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            foodName.bottomAnchor.constraint(equalTo: descFood.topAnchor, constant: -5),
            //desc
            descFood.leadingAnchor.constraint(equalTo: foodName.leadingAnchor),
            descFood.trailingAnchor.constraint(equalTo: foodName.trailingAnchor),
            descFood.bottomAnchor.constraint(equalTo: pricateLbl.topAnchor, constant: -5),
            //price
            pricateLbl.leadingAnchor.constraint(equalTo: foodName.leadingAnchor),
            pricateLbl.trailingAnchor.constraint(equalTo: btnAdd.leadingAnchor, constant: -10),
            pricateLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            //btn
            btnAdd.trailingAnchor.constraint(equalTo: foodName.trailingAnchor),
            btnAdd.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            btnAdd.widthAnchor.constraint(equalToConstant: 80),
            
        ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
