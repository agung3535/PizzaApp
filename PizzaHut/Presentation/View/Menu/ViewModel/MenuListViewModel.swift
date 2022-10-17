//
//  MenuViewModel.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import Foundation
import RxSwift

class MenuListViewModel: ObservableObject {
    
    private(set) var listMenu = BehaviorSubject<[PizzaMenu]>(value: [])

    func getMenuData() {
        listMenu.onNext(DataDummy.generateMenuPizza())
    }
    
}
