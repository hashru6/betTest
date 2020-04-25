//
//  SecondViewViewController.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol SecondViewViewInput: AnyObject {
    func setupInitialState(with viewModel: SecondViewViewModel)
}

protocol SecondViewViewOutput {
    func viewIsReady(_ controller: UIViewController)
    func openCardPressed()
}

class SecondViewViewController: UIViewController, SecondViewViewInput {
    @IBOutlet private weak var text: UILabel!
    @IBOutlet private weak var openCard: UIButton!
    
    var output: SecondViewViewOutput?

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
        self.text.text = "Проверяем интерактивность еще одного окна - жмем на него"
        self.title = "Окно 2"
        self.openCard.setTitle("Открыть карточку", for: UIControl().state)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.changeBg)))
    }
    
    func setupActions() {
        
    }
    
    func applyStyles() {
        self.text.font = UIFont.boldSystemFont(ofSize: 20)
        self.text.textColor = .black
    }
    
    // MARK: - SecondViewViewInput
    func setupInitialState(with viewModel: SecondViewViewModel) {
        self.setupComponents()
    }
}

// MARK: - Actions
extension SecondViewViewController {
    @IBAction private func openCardPressed(_ sender: Any) {
        self.output?.openCardPressed()
    }
    
    @objc
    private func changeBg() {
        self.view.backgroundColor = Int.random(in: 0...1) == 0 ? .green : .orange
    }
}

// MARK: - Module functions
extension SecondViewViewController {
 
}

