//
//  FirstViewInteractor.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

protocol FirstViewInteractorInput: AnyObject {
    
}

protocol FirstViewInteractorOutput: AnyObject {

}

open class FirstViewInteractor: FirstViewInteractorInput {
    weak var output: FirstViewInteractorOutput?
    
    init() {

    }
}

