//
//  TopViewModel.swift
//  reactive
//
//  Created by Vitaly Skorobreshchuk on 5/25/16.
//  Copyright © 2016 MEV. All rights reserved.
//

import Foundation
import ReactiveCocoa

class TopViewModel {
    
    private(set) var value = MutableProperty<String>("")
    
    func didEnterValue(text: String) {
        value.value = text
    }
    
}