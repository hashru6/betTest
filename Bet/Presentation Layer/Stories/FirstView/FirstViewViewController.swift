//
//  FirstViewViewController.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol FirstViewViewInput: AnyObject {
    func setupInitialState(with viewModel: FirstViewViewModel)
}

protocol FirstViewViewOutput {
    func viewIsReady(_ controller: UIViewController)
    func openCardPressed()
}

class FirstViewViewController: UIViewController, FirstViewViewInput {
    @IBOutlet private weak var text: UILabel!
    @IBOutlet private weak var openCard: UIButton!
    
    var output: FirstViewViewOutput?

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
        self.text.text = "Проверяем интерактивность окна - жмем на него"
        self.title = "Окно 1"
        self.openCard.setTitle("Открыть карточку", for: UIControl().state)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.changeBg)))
    }
    
    func setupActions() {
        
    }
    
    func applyStyles() {
        self.text.font = UIFont.boldSystemFont(ofSize: 20)
        self.text.textColor = .black
    }
    
    // MARK: - FirstViewViewInput
    func setupInitialState(with viewModel: FirstViewViewModel) {
        self.setupComponents()
    }
}

// MARK: - Actions
extension FirstViewViewController {
    @IBAction private func openCardPressed(_ sender: Any) {
        self.output?.openCardPressed()
    }
    
    @objc
    private func changeBg() {
        self.view.backgroundColor = Int.random(in: 0...1) == 0 ? .red : .yellow
    }
}

// MARK: - Module functions
extension FirstViewViewController {
 
}

