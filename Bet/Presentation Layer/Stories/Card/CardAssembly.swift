//
//  CardAssembly.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

enum CardAssembly {
    static func create() -> CardViewController {
        return CardViewController()
    }
    
    @discardableResult
    static func configure(with reference: CardViewController) -> CardPresenterInput {
        let presenter = CardPresenter()
        
        let interactor = CardInteractor()
        interactor.output = presenter
        
        let router = CardRouter()
        router.mainController = reference
        
        presenter.view = reference
        presenter.interactor = interactor
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
}

