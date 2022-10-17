//
//  NewsViewModel.swift
//  PizzaHut
//
//  Created by Putra on 06/10/22.
//

import Foundation
import RxSwift

class NewsViewModel: ObservableObject {
    
    private(set) var newsData = BehaviorSubject<[NewsModel]>(value: [])

    func getNewsData() {
        newsData.onNext(DataDummy.generateNews())
    }
    
    
}
