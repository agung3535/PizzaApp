//
//  InboxTableViewCell.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import UIKit

class InboxTableViewCell: UITableViewCell {
    
    static let identifier = "InboxTableViewCell"
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let descLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLbl)
        addSubview(descLbl)
        setupConstraint()
    }
    
    func setupData(data: InboxResource) {
        titleLbl.text = data.title
        descLbl.text = data.desc
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLbl.bottomAnchor.constraint(equalTo: descLbl.topAnchor, constant: -5),
            descLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor),
            descLbl.trailingAnchor.constraint(equalTo: titleLbl.trailingAnchor),
            descLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
