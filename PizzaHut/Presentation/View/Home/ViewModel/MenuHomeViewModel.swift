//
//  MenuViewModel.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import Foundation
import RxSwift

class MenuHomeViewModel: ObservableObject {
    
    private(set) var homeMenu = BehaviorSubject<[MenuModel]>(value: [])

    func getMenuData() {
        homeMenu.onNext(DataDummy.generateMenu())
    }
    
}
