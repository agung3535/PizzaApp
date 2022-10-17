//
//  InboxViewModel.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import Foundation
import RxSwift

class InboxViewModel: ObservableObject {
    
    private(set) var inboxData = BehaviorSubject<[InboxModel]>(value: [])
    
    
    func getInbox() {
        inboxData.onNext(DataDummy.generateInbox())
    }
    
    
    let dataSource = InboxDataSource.dataSource()
    
}
