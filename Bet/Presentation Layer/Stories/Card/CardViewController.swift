//
//  CardViewController.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol CardViewInput: AnyObject {
    func setupInitialState(with viewModel: CardViewModel)
}

protocol CardViewOutput {
    func viewIsReady(_ controller: UIViewController)
}

class CardViewController: UIViewController, CardViewInput {
    @IBOutlet private weak var text: UILabel!
    @IBOutlet private weak var secondText: UILabel!
    @IBOutlet private weak var thirdText: UILabel!
    @IBOutlet private weak var cardDescription: UITextView!
    @IBOutlet private weak var movingMark: UIView!
    
    var output: CardViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.output?.viewIsReady(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.applyStyles()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - Setup
    func setupComponents() {
        self.text.text = "Какой-то текст"
        self.secondText.text = "Еще что-то"
        self.thirdText.text = "И еще"
    }
    
    func setupActions() {
        
    }
    
    func applyStyles() {
        [self.text, self.thirdText, self.secondText].forEach({
            $0?.font = UIFont.boldSystemFont(ofSize: 20)
            $0?.textColor = .black
        })
        
        self.cardDescription.font = UIFont.boldSystemFont(ofSize: 16)
        self.cardDescription.textColor = .black
        self.cardDescription.backgroundColor = .lightGray
        self.view.backgroundColor = .lightGray
        self.movingMark.layer.cornerRadius = self.movingMark.bounds.height / 2
        self.movingMark.backgroundColor = .gray
    }
    
    // MARK: - CardViewInput
    func setupInitialState(with viewModel: CardViewModel) {
        self.setupComponents()
    }
}

// MARK: - Actions
extension CardViewController {

}

// MARK: - Module functions
extension CardViewController {
 
}
