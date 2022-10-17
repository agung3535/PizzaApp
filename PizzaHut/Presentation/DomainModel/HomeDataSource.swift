//
//  HomeDataSource.swift
//  PizzaHut
//
//  Created by Putra on 06/10/22.
//

import Foundation
import RxDataSources

struct HomeDataSource {
    typealias HDataSource = RxCollectionViewSectionedReloadDataSource
    
    static func hDataSource(parent: HomeViewController) -> HDataSource<HomeDomainModel> {
        return .init(configureCell: { dataSource, collectionView, indexPath, item -> UICollectionViewCell in
            if let data = item as? MenuModel {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalListCollectionViewCell.identifier, for: indexPath) as? HorizontalListCollectionViewCell else { return UICollectionViewCell() }
                cell.setupMenu(menuViewModel: MenuHomeViewModel())
                cell.sectionVal = .menu
                cell.homeVC = parent
                return cell
            }else if let data = item as? NewsModel {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalListCollectionViewCell.identifier, for: indexPath) as? HorizontalListCollectionViewCell else { return UICollectionViewCell() }
                cell.setupNews(vm: NewsViewModel())
                cell.sectionVal = .news
                return cell
            }else if let data = item as? SlideModel {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalListCollectionViewCell.identifier, for: indexPath) as? HorizontalListCollectionViewCell else { return UICollectionViewCell() }
                cell.setupSlide(vm: SlideViewModel())
                cell.sectionVal = .slider
                
                return cell
            }
            return UICollectionViewCell()
            
        }, configureSupplementaryView: {dataSource,collectionView,kind, indexPath -> UICollectionReusableView in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeAccountCollectionReusableView.identifier, for: indexPath) as? HomeAccountCollectionReusableView else { return UICollectionReusableView() }
            return header
        })
        
    }
}



