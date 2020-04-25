//
//  CardPresenter.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol CardPresenterInput: AnyObject { }

class CardPresenter: CardPresenterInput, CardViewOutput, CardInteractorOutput {
    weak var view: CardViewInput?
    var interactor: CardInteractorInput?
    var router: CardRouterInput?
    
    var viewModel: CardViewModel

    init() {
        self.viewModel = CardViewModel()
    }
    
    // MARK: - CardPresenterInput
    
    // MARK: - CardViewOutput
    func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - CardInteractorOutput
     
    // MARK: - Module functions
    
}
