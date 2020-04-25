//
//  SecondViewRouter.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

protocol SecondViewRouterInput: AnyObject {

}

class SecondViewRouter: SecondViewRouterInput {
    weak var mainController: SecondViewViewController?
    
    // MARK: - SecondViewRouterInput
    
    // MARK: - Module functions
}

