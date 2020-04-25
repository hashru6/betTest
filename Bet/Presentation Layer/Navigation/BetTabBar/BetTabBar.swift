//
//  BetTabBar.swift
//  Bet
//
//  Created by Denis Volodchenko on 25.04.2020.
//  Copyright © 2020 DV. All rights reserved.
//

import UIKit

public class BetTabBar: UIViewController {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var buttonsHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var buttonsView: UIView!
    @IBOutlet private weak var elementsStack: UIStackView!
    @IBOutlet private weak var bottomDynamicContainer: UIView!
    @IBOutlet private weak var bottomContainerHeight: NSLayoutConstraint!
    
    private var elements: [BarElement] = []
    private var views: [UIViewController] = []
    private var selectedIndex = 0
    private var bottomContainerHeightDefault: CGFloat = 200
    
    var selectedViewController: UIViewController? {
        if self.views.count > self.selectedIndex {
            return self.views[self.selectedIndex]
        } else {
            return nil
        }
    }

    public class var fromXib: BetTabBar {
        return BetTabBar(nibName: "BetTabBar", bundle: nil)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.applyStyles()
               
        self.views = self.generateControllers()
        self.elements = self.generateElements()
        self.setupGestures()
        self.resetupTabbar()
    }

    func resetupTabbar() {
        for view in self.containerView.subviews {
            view.removeFromSuperview()
        }
        self.addChild(self.views[self.selectedIndex])
        self.views[self.selectedIndex].view.frame = self.containerView.bounds

        self.containerView.addSubview(self.views[self.selectedIndex].view)
        self.view.layoutIfNeeded()

        UIView.animate(withDuration: 0.1) {
            self.elements.forEach({
                $0.setInactive()
            })
            
            self.elements[self.selectedIndex].setActive()
            self.view.layoutIfNeeded()
        }
    }

    public func hide() {
        self.buttonsHeightConstraint.constant = 0
        self.buttonsView.isHidden = true
    }

    public func show() {
        self.buttonsHeightConstraint.constant = 64
        self.buttonsView.isHidden = false
    }
    
    public func showBottomContainer(with vc: UIViewController) {
        self.removeChildren()
        self.addChild(vc)
        self.bottomDynamicContainer.addSubview(vc.view)
        self.bottomContainerHeight.constant = self.bottomContainerHeightDefault

        vc.view.frame = self.view.frame
        vc.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:))))
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc
    private func barElementPressed(_ sender: UIGestureRecognizer) {
        self.selectedIndex = sender.view?.tag ?? 0
        self.resetupTabbar()
    }
    
    @objc
    private func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .changed {
            let moveY = -gestureRecognizer.translation(in: self.view).y

            if self.bottomContainerHeight.constant < self.view.bounds.height * 0.80 {
                self.bottomContainerHeight.constant = (moveY + self.bottomContainerHeightDefault)
            } else if self.bottomContainerHeightDefault + moveY < self.view.bounds.height * 0.80 {
                self.bottomContainerHeight.constant = (moveY + self.bottomContainerHeightDefault)
            }
            
            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
        } else if gestureRecognizer.state == .began {
            self.bottomContainerHeightDefault = self.bottomContainerHeight.constant
        } else if gestureRecognizer.state == .ended {
            if self.bottomContainerHeight.constant < 200 {
                self.bottomContainerHeight.constant = 0
                self.bottomContainerHeightDefault = 200
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.removeChildren()
                })
            }
        }
    }
    
    private func applyStyles() {
        self.bottomView.backgroundColor = .customLightGray
        self.buttonsView.backgroundColor = .customLightGray
        self.bottomDynamicContainer.layer.cornerRadius = 12
        self.bottomDynamicContainer.clipsToBounds = true
    }
    
    private func generateElements() -> [BarElement] {
        let first = StandardElement.loadNib()
        first.setup(title: "Окно 1", icon: UIImage(named: "home"))
        first.tag = 0
        
        let second = StandardElement.loadNib()
        second.setup(title: "Окно 2", icon: UIImage(named: "home"))
        second.tag = 1
        
        let third = StandardElement.loadNib()
        third.setup(title: "Окно 3", icon: UIImage(named: "home"))
        third.tag = 2
        
        return [first, second, third]
    }
    
    private func generateControllers() -> [UIViewController] {
        let firstVC = FirstViewAssembly.create()
        let _ = FirstViewAssembly.configure(with: firstVC)
        let firstNC = UINavigationController(rootViewController: firstVC)
        
        let secondVC = SecondViewAssembly.create()
        let _ = SecondViewAssembly.configure(with: secondVC)
        let secondNC = UINavigationController(rootViewController: secondVC)
        
        let thirdVC = ThirdViewAssembly.create()
        let _ = ThirdViewAssembly.configure(with: thirdVC)
        let thirdNC = UINavigationController(rootViewController: thirdVC)
        
        return [firstNC, secondNC, thirdNC]
    }
    
    private func setupGestures() {
        for element in self.elements {
            if let view = element as? UIView {
                self.elementsStack.addArrangedSubview(view)
                view.isUserInteractionEnabled = true
                view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.barElementPressed(_:))))
            }
        }
    }
    
    private func removeChildren() {
        self.children.forEach({
            $0.removeFromParent()
        })
        self.bottomDynamicContainer.subviews.forEach({
            $0.removeFromSuperview()
        })
    }
}
