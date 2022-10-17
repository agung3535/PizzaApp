//
//  HomeViewModel.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import Foundation
import RxSwift
import RxDataSources

class HomeViewModel: ObservableObject {
    
    private(set) var homeMenu = BehaviorSubject<[MenuModel]>(value: [])
    
    private(set) var homeData = BehaviorSubject<[HomeDomainModel]>(value: [])
    
   
    
    private(set) var dataSource: RxCollectionViewSectionedReloadDataSource<HomeDomainModel>?
    
    
//    func getMenuData() -> Observable<[MenuModel]> {
//        homeMenu.onNext(DataDummy.generateMenu())
//        return homeMenu
//    }
    
    func getHomeData() {
        homeData.onNext(DataDummy.generateHome())
    }
    

    func getMenuData() {
        homeMenu.onNext(DataDummy.generateMenu())
    }
    
    func setParent(parent: HomeViewController) {
//        self.parent = parent
        self.dataSource = HomeDataSource.hDataSource(parent: parent)
    }
   
}
