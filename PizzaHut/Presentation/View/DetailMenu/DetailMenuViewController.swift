//
//  DetailMenuViewController.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class DetailMenuViewController: UIViewController {

    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(HeaderLabelCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderLabelCollectionReusableView.identifier)
        view.register(OptionToppingCollectionViewCell.self, forCellWithReuseIdentifier: OptionToppingCollectionViewCell.identifier)
        view.register(HorizontalListCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalListCollectionViewCell.identifier)
        view.register(DescriptionCollectionViewCell.self, forCellWithReuseIdentifier: DescriptionCollectionViewCell.identifier)
        return view
    }()
    
    var pizza: PizzaMenu!
    var vm: DetailMenuViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainCollectionView)
        vm.getDetail(data: pizza)
        vm.detailMenu.bind(to: mainCollectionView
            .rx
            .items(dataSource: vm.dataSource))
        .disposed(by: disposeBag)
        mainCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        setupConstraint()
        
    }
    
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DetailMenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section != 0 {
            return CGSize(width: collectionView.frame.size.width, height: 30)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 200)
        }
        return CGSize(width: collectionView.frame.width, height: 120)
        
    }
}

