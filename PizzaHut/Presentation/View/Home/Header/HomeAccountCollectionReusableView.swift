//
//  HomeAccountCollectionReusableView.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit


class HomeAccountCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HomeAccountCollectionReusableView"
    
    private let stackHeader: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private let viewAkun: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let viewLogo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let viewCart: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let labelNameUser: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let labelPoint: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupView()
        labelNameUser.text = "Hi, Agung"
        labelPoint.text = "0 Point"
    }
    
    private func setupView() {
        addSubview(stackHeader)
        stackHeader.addArrangedSubview(viewAkun)
        
        viewAkun.addSubview(labelNameUser)
        viewAkun.addSubview(labelPoint)
        
        
        
        stackHeader.addArrangedSubview(viewLogo)
        viewLogo.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "logo-pizzahut")
        
        stackHeader.addArrangedSubview(viewCart)
        
        //constraint
        
        NSLayoutConstraint.activate([
            //root header
            stackHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackHeader.topAnchor.constraint(equalTo: topAnchor),
            stackHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackHeader.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //constraint info user
            labelNameUser.leadingAnchor.constraint(equalTo: viewAkun.leadingAnchor, constant: 20),
            labelNameUser.topAnchor.constraint(equalTo: viewAkun.topAnchor, constant: 15),
            labelNameUser.trailingAnchor.constraint(equalTo: viewAkun.trailingAnchor),
            
            labelPoint.leadingAnchor.constraint(equalTo: labelNameUser.leadingAnchor),
            labelPoint.trailingAnchor.constraint(equalTo: labelNameUser.trailingAnchor),
            labelPoint.topAnchor.constraint(equalTo: labelNameUser.bottomAnchor, constant: 5),
            
            //logo
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

