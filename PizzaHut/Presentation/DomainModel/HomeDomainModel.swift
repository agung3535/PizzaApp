//
//  HomeDomainModel.swift
//  PizzaHut
//
//  Created by Putra on 06/10/22.
//

import Foundation
import RxDataSources

struct HomeDomainModel {
    let items: [Any]
    let title: String
    
    init(items: [Any], title: String) {
        self.items = items
        self.title = title
    }
    
}

extension HomeDomainModel: SectionModelType {
    typealias Item = Any
    init(original: Self, items: [Self.Item]) {
        self = original
    }
    
    
}




