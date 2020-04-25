//
//  SecondViewAssembly.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

enum SecondViewAssembly {
    static func create() -> SecondViewViewController {
        return SecondViewViewController()
    }
    
    @discardableResult
    static func configure(with reference: SecondViewViewController) -> SecondViewPresenterInput {
        let presenter = SecondViewPresenter()
        
        let interactor = SecondViewInteractor()
        interactor.output = presenter
        
        let router = SecondViewRouter()
        router.mainController = reference
        
        presenter.view = reference
        presenter.interactor = interactor
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
}


