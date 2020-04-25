//
//  BarElement.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

class StandardElement: UIView, BarElement {
    @IBOutlet private weak var container: UIView!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var text: UILabel!
    @IBOutlet private weak var centerConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        self.applyStyles()
    }
    
    func setup(title: String, icon: UIImage?) {
        self.image.image = icon
        self.text.text = title
    }
    
    func setActive() {
        self.centerConstraint.constant = -12
        self.image.tintColor = .black
        self.text.textColor = .black
    }
    
    func setInactive() {
        self.centerConstraint.constant = -4
        self.image.tintColor = .lightGray
        self.text.textColor = .lightGray
    }
    
    private func applyStyles() {
        self.backgroundColor = .red
        self.text.font = UIFont.systemFont(ofSize: 12)
        self.text.textColor = .lightGray
        self.image.contentMode = .scaleToFill
        self.container.backgroundColor = .customLightGray
    }
}
