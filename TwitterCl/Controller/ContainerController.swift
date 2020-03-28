//
//  ContainerController.swift
//  TwitterCl
//
//  Created by Abdullah on 27/03/2020.
//  Copyright © 2020 Abdullah. All rights reserved.
//

import Foundation

import UIKit

class ContainerController: UIViewController {
    //MARK: - Properties
    
    var menuController: MenuController!
    var centerController: UIViewController!
    let homeController = MainTabController()
    var isExpanded = false
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    //MARK: - Handlers
    
    func configureHomeController() {
        homeController.menuDelegate = self
        centerController = homeController
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            //add our menu controller
            
            menuController = MenuController(user: homeController.user)
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showMenuController(shouldExpand: Bool) {
        
        if shouldExpand {
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                
            }, completion: nil)
        } else {
            //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.frame.origin.x = 0
                
            }, completion: nil)
        }
        
    }
    
}

extension ContainerController: HomeControllerDelegate {
    
    func handleMenuToggle() {
        
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
    
}
