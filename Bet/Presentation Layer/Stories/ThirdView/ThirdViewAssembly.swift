//
//  ThirdViewAssembly.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

enum ThirdViewAssembly {
    static func create() -> ThirdViewViewController {
        return ThirdViewViewController()
    }
    
    @discardableResult
    static func configure(with reference: ThirdViewViewController) -> ThirdViewPresenterInput {
        let presenter = ThirdViewPresenter()
        
        let interactor = ThirdViewInteractor()
        interactor.output = presenter
        
        let router = ThirdViewRouter()
        router.mainController = reference
        
        presenter.view = reference
        presenter.interactor = interactor
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
}


