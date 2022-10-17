//
//  MenuModel.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import Foundation


struct MenuModel {
    let id: Int
    let name, icon: String
    let type: MenuType
}


enum MenuType {
    case menu
    case myVoucher
}
