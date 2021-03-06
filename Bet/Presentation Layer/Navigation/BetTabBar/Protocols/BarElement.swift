//
//  Elements.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol BarElement {
    func setup(title: String, icon: UIImage?)
    func setActive()
    func setInactive()
}
