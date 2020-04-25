//
//  ThirdViewInteractor.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

protocol ThirdViewInteractorInput: AnyObject {
    
}

protocol ThirdViewInteractorOutput: AnyObject {

}

open class ThirdViewInteractor: ThirdViewInteractorInput {
    weak var output: ThirdViewInteractorOutput?
    
    init() {

    }
}

