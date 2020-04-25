//
//  ThirdViewPresenter.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol ThirdViewPresenterInput: AnyObject { }

class ThirdViewPresenter: ThirdViewPresenterInput, ThirdViewViewOutput, ThirdViewInteractorOutput {
    weak var view: ThirdViewViewInput?
    var interactor: ThirdViewInteractorInput?
    var router: ThirdViewRouterInput?
    
    var viewModel: ThirdViewViewModel

    init() {
        self.viewModel = ThirdViewViewModel()
    }
    
    // MARK: - ThirdViewPresenterInput
    
    // MARK: - ThirdViewViewOutput
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
    
    // MARK: - ThirdViewInteractorOutput
     
    // MARK: - Module functions
    
}
