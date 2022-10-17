//
//  MyVoucherTableViewCell.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import UIKit

class MyVoucherTableViewCell: UITableViewCell {
    
    static let identifier = "MyVoucherTableViewCell"
    
    private let imgVoucher: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let voucherName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let validLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let viewDesc: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(imgVoucher)
        addSubview(viewDesc)
        viewDesc.addSubview(voucherName)
        viewDesc.addSubview(validLbl)
        viewDesc.layer.shadowColor = UIColor.gray.cgColor
        viewDesc.layer.shadowOpacity = 1
        viewDesc.layer.shadowOffset = CGSize.zero
        viewDesc.layer.shadowRadius = 3
        
        
        
        setupConstraint()
        backgroundColor = .clear
    }
    
    func setupData(data: VoucerModel) {
        imgVoucher.image = UIImage(named: data.image)
        voucherName.text = data.title
        validLbl.text = data.validData
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            imgVoucher.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imgVoucher.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imgVoucher.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            imgVoucher.bottomAnchor.constraint(equalTo: viewDesc.topAnchor, constant: -10),
            imgVoucher.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            imgVoucher.heightAnchor.constraint(equalTo: imgVoucher.widthAnchor, multiplier: 0.8),
            
            viewDesc.leadingAnchor.constraint(equalTo: imgVoucher.leadingAnchor),
            viewDesc.trailingAnchor.constraint(equalTo: imgVoucher.trailingAnchor),
            viewDesc.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            voucherName.leadingAnchor.constraint(equalTo: viewDesc.leadingAnchor, constant: 15),
            voucherName.topAnchor.constraint(equalTo: viewDesc.topAnchor, constant: 10),
            voucherName.trailingAnchor.constraint(equalTo: viewDesc.trailingAnchor, constant: -15),
            voucherName.bottomAnchor.constraint(equalTo: validLbl.topAnchor, constant: -10),
            
            validLbl.leadingAnchor.constraint(equalTo: voucherName.leadingAnchor),
            validLbl.trailingAnchor.constraint(equalTo: voucherName.trailingAnchor),
            validLbl.bottomAnchor.constraint(equalTo: viewDesc.bottomAnchor, constant: -10),
            
            
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
