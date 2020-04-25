//
//  ThirdViewViewController.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

protocol ThirdViewViewInput: AnyObject {
    func setupInitialState(with viewModel: ThirdViewViewModel)
}

protocol ThirdViewViewOutput {
    func viewIsReady(_ controller: UIViewController)
    func openCardPressed()
}

class ThirdViewViewController: UIViewController, ThirdViewViewInput {
    @IBOutlet private weak var text: UILabel!
    @IBOutlet private weak var openCard: UIButton!
    
    var output: ThirdViewViewOutput?

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
        self.text.text = "Проверяем интерактивность последнего окна - жмем на него"
        self.title = "Окно 3"
        self.openCard.setTitle("Открыть карточку", for: UIControl().state)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.changeBg)))
    }
    
    func setupActions() {
        
    }
    
    func applyStyles() {
        self.text.font = UIFont.boldSystemFont(ofSize: 20)
        self.text.textColor = .black
    }
    
    // MARK: - ThirdViewViewInput
    func setupInitialState(with viewModel: ThirdViewViewModel) {
        self.setupComponents()
    }
}

// MARK: - Actions
extension ThirdViewViewController {
    @IBAction private func openCardPressed(_ sender: Any) {
        self.output?.openCardPressed()
    }
    
    @objc
    private func changeBg() {
        self.view.backgroundColor = Int.random(in: 0...1) == 0 ? .brown : .cyan
    }
}

// MARK: - Module functions
extension ThirdViewViewController {
 
}
