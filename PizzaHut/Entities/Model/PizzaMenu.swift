//
//  MenuModel.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import Foundation


struct PizzaMenu {
    let id: Int
    let name, description, image: String
    let price: Int
    let ukuran: [Ukuran]
    let pinggiran: [Pinggiran]
}

struct Ukuran {
    let id: Int
    let typeSize: String
    let description: String
}

struct Pinggiran {
    let id: Int
    let typePinggiran: String
}
