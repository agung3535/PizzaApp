//
//  SlideViewModel.swift
//  PizzaHut
//
//  Created by Putra on 06/10/22.
//

import Foundation
import RxSwift

class SlideViewModel: ObservableObject {
    
    private(set) var sliderData = BehaviorSubject<[SlideModel]>(value: [])

    func getSliderHome() {
        sliderData.onNext(DataDummy.generateSlide())
    }
    
    
}
