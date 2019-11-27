//
//  HomeInterfaces.swift
//  ViperTemplateProject
//
//  Created by Matias Radzinski on 12/17/18.
//  Copyright © 2018 Bixlabs. All rights reserved.
//

import Foundation

// MARK: - Home Wireframe Interface -
protocol HomeWireframeInterface: WireframeInterface {
    func navigateToNextViewController(_ data: HomeEntity)
}

// MARK: - Home View Interface -
protocol HomeViewInterface: ViewInterface {
    var presenter: HomeViewDelegateInterface? { get set }
}

// MARK: - Home View Delegate (Presenter) Interface -
protocol HomeViewDelegateInterface: PresenterInterface {
    
    var _wireframe: HomeWireframeInterface { get }
    var _view: HomeViewInterface { get }
    var _interactor: HomeInteractorInterface? { get }
    
    func didPressOK()
}

// MARK: - Home Interactor Interface -
protocol HomeInteractorInterface: InputInteractorInterface {
    var presenter: HomeOutputInteractorInterface? { get set }
    var homeManagmentService: HomeManagmentService { get }
    
    func fetchtHomeData()
}

// MARK: - Home Output Interactor Interface -
protocol HomeOutputInteractorInterface: OutputInteractorInterface {
    func onGetHomeData(_ data: HomeEntity)
}
