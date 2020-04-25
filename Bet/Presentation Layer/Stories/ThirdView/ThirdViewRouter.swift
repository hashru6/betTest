//
//  ThirdViewRouter.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import Foundation

protocol ThirdViewRouterInput: AnyObject {

}

class ThirdViewRouter: ThirdViewRouterInput {
    weak var mainController: ThirdViewViewController?
    
    // MARK: - ThirdViewRouterInput
    
    // MARK: - Module functions
}
