//
//  SecondViewInteractor.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

protocol SecondViewInteractorInput: AnyObject {
    
}

protocol SecondViewInteractorOutput: AnyObject {

}

open class SecondViewInteractor: SecondViewInteractorInput {
    weak var output: SecondViewInteractorOutput?
    
    init() {

    }
}

