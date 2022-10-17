//
//  DetailMenuTableViewCell.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class DetailMenuTableViewCell: UITableViewCell {
    
    
    static let identifier = "DetailMenuTableViewCell"
    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(HorizontalListCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalListCollectionViewCell.identifier)
        return view
    }()
    private let disposeBag = DisposeBag()
    
//    var pizzaDetail: Observable<[DetailPizzaMenuSection]>!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainCollectionView)
        setupConstraint()
        
    }
    
    func setupData(data: DetailPizzaMenuSection, vm: DetailMenuViewModel) {
        print("masuk detail setup")
        vm.getDetailInfo(data: data)
//        vm.detailPinggiran.bind(to: mainCollectionView
//            .rx
//            .items(cellIdentifier: HorizontalListCollectionViewCell.identifier, cellType: HorizontalListCollectionViewCell.self)) { row, element, cell in
//                cell.setupPinggiran(vm: vm, pizza: element)
//            }.disposed(by: disposeBag)
//        data.bind(to: mainCollectionView
//            .rx
//            .items(cellIdentifier: HorizontalListCollectionViewCell.identifier, cellType: HorizontalListCollectionViewCell.self)) { row, element, cell in
//                if let data = element.items as? Pinggiran {
//                    cell.setupPinggiran(vm: DetailMenuViewModel(), pizza: element.items.first as! PizzaMenu)
//                }
//            }
//        .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            mainCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainCollectionView.topAnchor.constraint(equalTo: topAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
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
