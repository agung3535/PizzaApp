//
//  NewsListCollectionViewCell.swift
//  PizzaHut
//
//  Created by Putra on 06/10/22.
//

import UIKit
import RxSwift


class NewsListCollectionViewCell: UICollectionViewCell {
    static let identifier = "NewsListCollectionViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(SliderCollectionViewCell.self, forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
        view.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        view.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        view.backgroundColor = .white
        return view
    }()
    
    private let mainBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("masuk collect")
        addSubview(mainBackground)
        addSubview(collectionView)
        backgroundColor = .brown
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        setupView()
    }
    
    
    func setupMenu(menuViewModel: MenuHomeViewModel) {
        print("masuk menu = \(menuViewModel)")
        menuViewModel.getMenuData()
        menuViewModel.homeMenu.bind(to: collectionView
            .rx
            .items(cellIdentifier: MenuCollectionViewCell.identifier, cellType: MenuCollectionViewCell.self)) { row, element, cell in
                cell.setupData(data: element)
            }.disposed(by: disposeBag)
        
    }
    
    func setupNews(vm: NewsViewModel) {
        print("masuk news")
        vm.getNewsData()
        vm.newsData.bind(to: collectionView
            .rx
            .items(cellIdentifier: NewsCollectionViewCell.identifier, cellType: NewsCollectionViewCell.self)) { row, element, cell in
                cell.setupData(data: element)
            }.disposed(by: disposeBag)
    }
    
    
    func setupView() {
       
        NSLayoutConstraint.activate([
            mainBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainBackground.topAnchor.constraint(equalTo: topAnchor),
            mainBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainBackground.heightAnchor.constraint(equalToConstant: 25),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        print("masuk setup view \(collectionView.frame.size.width)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension NewsListCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("masuk index = \(indexPath.row)")
        return CGSize(width: collectionView.frame.width / 1, height: collectionView.frame.height / 1)
    }
}
