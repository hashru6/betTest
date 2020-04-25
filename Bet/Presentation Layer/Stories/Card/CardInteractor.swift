//
//  CardInteractor.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

protocol CardInteractorInput: AnyObject {
    
}

protocol CardInteractorOutput: AnyObject {

}

open class CardInteractor: CardInteractorInput {
    weak var output: CardInteractorOutput?
    
    init() {

    }
}
