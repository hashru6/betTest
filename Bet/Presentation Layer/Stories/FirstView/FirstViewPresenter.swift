//
//  FirstViewPresenter.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol FirstViewPresenterInput: AnyObject { }

class FirstViewPresenter: FirstViewPresenterInput, FirstViewViewOutput, FirstViewInteractorOutput {
    weak var view: FirstViewViewInput?
    var interactor: FirstViewInteractorInput?
    var router: FirstViewRouterInput?
    
    var viewModel: FirstViewViewModel

    init() {
        self.viewModel = FirstViewViewModel()
    }
    
    // MARK: - FirstViewPresenterInput
    
    // MARK: - FirstViewViewOutput
    func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    func openCardPressed() {
        if let tabbar = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first?
        .rootViewController as? BetTabBar {
            let card = CardAssembly.create()
            let _ = CardAssembly.configure(with: card)
            
            tabbar.showBottomContainer(with: card)
        }
    }
    
    // MARK: - FirstViewInteractorOutput
     
    // MARK: - Module functions
    
}
