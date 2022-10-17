//
//  DetailMenuViewModel.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import Foundation
import RxSwift


class DetailMenuViewModel: ObservableObject {
    
    private(set) var detailMenu = BehaviorSubject<[DetailPizzaMenuSection]>(value: [])
    private(set) var detailMenuData = PublishSubject<PizzaMenu>()
    private(set) var detailPinggiran = BehaviorSubject<[Pinggiran]>(value: [])
    private(set) var detailUkuran = BehaviorSubject<[Ukuran]>(value: [])
    

    
    
    func getDetail(data: PizzaMenu) {
        detailMenu.onNext(DataDummy.mapDataPizzaToDetail(data: data))
    }
    
    func getDetailInfo(id: Int) {
        detailMenuData.onNext(DataDummy.getDetailPizza(id: id))
    }
    
    func getDetailPinggiran(id: Int) {
        detailPinggiran.onNext(DataDummy.getDetailPinggiran(id: id))
    }
    
    func getDetailUkuran(id: Int) {
        detailUkuran.onNext(DataDummy.getDetailUkuran(id: id))
    }
    
    func getDetailInfo(data: DetailPizzaMenuSection) {
        if let dataItem = data.items.first as? PizzaMenu {
            detailMenuData.onNext(DataDummy.getDetailPizza(id: dataItem.id))
        }
    }
    
    let dataSource = DetailMenuPizzaDataSource.dataSource()
    
    
}
