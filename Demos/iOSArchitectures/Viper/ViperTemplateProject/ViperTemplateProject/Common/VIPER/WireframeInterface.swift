//
//  WireframeInterface.swift
//  ViperTemplateProject
//
//  Created by Matias Radzinski on 12/17/18.
//  Copyright © 2018 Bixlabs. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base Wireframe Interface -
protocol WireframeInterface: class {
    
    // MARK: REQUIRED
    var storyboard: UIStoryboard { get }
    var navigationController: UINavigationController? { get set }
    var viewController: UIViewController? { get set }
    
    init()
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController
}

// MARK: - Base Wireframe Interface Default Implementation -
extension WireframeInterface {
    
    // MARK: CONVENIENCE INIT
    init(navigationController: UINavigationController? = nil) {
        self.init()
        self.navigationController = navigationController
    }
    
    // MARK: PUSH
    func pushOnNavigationController() {
        navigationController?.pushViewController(instantiateViewController(nil as String?), animated: true)
    }
    
    func pushOnNavigationController<T>(_ context: T?) {
        navigationController?.pushViewController(instantiateViewController(context), animated: true)
    }
    
    // MARK: POP
    func popFromNavigationController() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: PRESENT
    func presentFromViewController(_ viewController: UIViewController) {
        viewController.present(instantiateViewController(nil as String?), animated: true, completion: nil)
    }
    
    func presentFromViewController<T>(_ viewController: UIViewController, context: T) {
        viewController.present(instantiateViewController(context), animated: true, completion: nil)
    }
    
    // MARK: DISMISS
    func dismissViewController() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
