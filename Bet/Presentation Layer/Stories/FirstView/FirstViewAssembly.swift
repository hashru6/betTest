//
//  FirstViewAssembly.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

enum FirstViewAssembly {
    static func create() -> FirstViewViewController {
        return FirstViewViewController()
    }
    
    @discardableResult
    static func configure(with reference: FirstViewViewController) -> FirstViewPresenterInput {
        let presenter = FirstViewPresenter()
        
        let interactor = FirstViewInteractor()
        interactor.output = presenter
        
        let router = FirstViewRouter()
        router.mainController = reference
        
        presenter.view = reference
        presenter.interactor = interactor
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
}


