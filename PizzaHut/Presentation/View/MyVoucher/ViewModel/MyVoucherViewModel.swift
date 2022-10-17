//
//  MyVoucherViewModel.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import Foundation
import RxSwift

class MyVoucherViewModel: ObservableObject {
    
    private(set) var listVoucher = BehaviorSubject<[VoucerModel]>(value: [])

    func getVoucherData() {
        listVoucher.onNext(DataDummy.generateVoucher())
    }
    
    
    
}
