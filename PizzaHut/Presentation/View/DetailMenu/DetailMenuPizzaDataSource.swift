//
//  DetailMenuPizzaDataSource.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import Foundation

import RxDataSources


struct DetailPizzaMenuSection {
    let items: [Any]
    let header: String
}

extension DetailPizzaMenuSection: SectionModelType {
    typealias Item = Any
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}

struct DetailMenuPizzaDataSource {
    typealias DataSource = RxCollectionViewSectionedReloadDataSource
    
    static func dataSource() -> DataSource<DetailPizzaMenuSection> {
        
        return .init(configureCell: {dataSource, collectionView, indexPath, item -> UICollectionViewCell in
            if let data = item as? PizzaMenu {
                print("masuk data source detail \(indexPath.section)")
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCollectionViewCell.identifier, for: indexPath) as? DescriptionCollectionViewCell else { return UICollectionViewCell()}
                cell.setupData(data: data)
                return cell
            }else if let data = item as? Pinggiran {
    
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalListCollectionViewCell.identifier, for: indexPath) as? HorizontalListCollectionViewCell else { return UICollectionViewCell() }
                if let pizza = dataSource[0].items as? [PizzaMenu] {
                
                    cell.setupPinggiran(vm: DetailMenuViewModel(),pizza: pizza.first!)
                    cell.sectionVal = .topping
                }
                return cell
            }else if let data = item as? Ukuran {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalListCollectionViewCell.identifier, for: indexPath) as? HorizontalListCollectionViewCell else { return UICollectionViewCell() }
                if let pizza = dataSource[0].items as? [PizzaMenu] {
                
                    cell.setupUkuran(vm: DetailMenuViewModel(),pizza: pizza.first!)
                    cell.sectionVal = .topping
                }
                return cell
            }
            
            return UICollectionViewCell()
        }, configureSupplementaryView: {dataSource, collectionView, kind, indexPath -> UICollectionReusableView in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderLabelCollectionReusableView.identifier, for: indexPath) as? HeaderLabelCollectionReusableView else { return UICollectionReusableView() }
            header.setupData(data: dataSource[indexPath.section].header)
            return header
        })
    }
}
