//
//  ViewController.swift
//  ViperTemplateProject
//
//  Created by Cris on 8/7/19.
//  Copyright © 2019 Bixlabs. All rights reserved.
//

import UIKit

// MARK: - Home View Controller -
class HomeViewController: UIViewController, HomeViewInterface {
    // MARK: Home view interface requirements
    var presenter: HomeViewDelegateInterface?
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBActions -
extension HomeViewController {
    
    @IBAction func okButtonActionHandler(_ sender: AnyObject) {
        presenter?.didPressOK()
    }
}
