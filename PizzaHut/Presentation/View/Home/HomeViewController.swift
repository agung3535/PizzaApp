//
//  HomeViewController.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(HomeAccountCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeAccountCollectionReusableView.identifier)
        view.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        view.register(SliderCollectionViewCell.self, forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
        view.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        view.register(HorizontalListCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalListCollectionViewCell.identifier)
        view.register(NewsListCollectionViewCell.self, forCellWithReuseIdentifier: NewsListCollectionViewCell.identifier)
        return view
    }()

    let homeViewModel = HomeViewModel()
    var homeData = [HomeDomainModel]()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainCollectionView)
        homeViewModel.getHomeData()
        homeViewModel.setParent(parent: self)
        homeViewModel.homeData
            .bind(to: mainCollectionView.rx.items(dataSource: homeViewModel.dataSource!))
            .disposed(by: disposeBag)
        mainCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        setupConstraint()
        
        
    }
    
    private func setupConstraint() {
        navigationController?.isNavigationBarHidden = true
        NSLayoutConstraint.activate([
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
   

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: 100)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 80)
        }
        return CGSize(width: collectionView.frame.width, height: 120)
        
    }
}

