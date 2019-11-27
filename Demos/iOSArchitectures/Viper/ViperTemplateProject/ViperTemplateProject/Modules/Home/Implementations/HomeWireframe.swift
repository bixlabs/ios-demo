//
//  HomeWireframe.swift
//  ViperTemplateProject
//
//  Created by Matias Radzinski on 12/17/18.
//  Copyright © 2018 Bixlabs. All rights reserved.
//

import Foundation
import UIKit
import os.log

// MARK: - Base Wireframe Interface Requirements -
final class HomeWireframe: HomeWireframeInterface {
    
    let HomeViewControllerIdentifier = "HomeViewController"
    
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    var storyboard: UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: HomeViewControllerIdentifier) as? HomeViewController else { return UIViewController() }
        
        let interactor = HomeInteractor()
        let presenter = HomePresenter(wireframe: self, view: homeViewController, interactor:interactor)
        
        homeViewController.presenter = presenter
        interactor.presenter = presenter
        return homeViewController
    }
    
}

// MARK: - Home Wireframe Interface Requirements -
extension HomeWireframe {
    
    func navigateToNextViewController(_ data: HomeEntity) {
        os_log("Navigate to next viewcontroller with title %s", data.title)
    }
}
