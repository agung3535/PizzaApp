//
//  HeaderLabelCollectionReusableView.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import UIKit

class HeaderLabelCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderLabelCollectionReusableView"
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    
    private func setupView() {
        addSubview(title)
        backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupData(data: String) {
        title.text = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
