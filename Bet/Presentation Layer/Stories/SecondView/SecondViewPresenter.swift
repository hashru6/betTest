//
//  SecondViewPresenter.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol SecondViewPresenterInput: AnyObject { }

class SecondViewPresenter: SecondViewPresenterInput, SecondViewViewOutput, SecondViewInteractorOutput {
    weak var view: SecondViewViewInput?
    var interactor: SecondViewInteractorInput?
    var router: SecondViewRouterInput?
    
    var viewModel: SecondViewViewModel

    init() {
        self.viewModel = SecondViewViewModel()
    }
    
    // MARK: - SecondViewPresenterInput
    
    // MARK: - SecondViewViewOutput
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
    
    // MARK: - SecondViewInteractorOutput
     
    // MARK: - Module functions
    
}
