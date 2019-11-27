//
//  HomePresenter.swift
//  ViperTemplateProject
//
//  Created by Matias Radzinski on 12/17/18.
//  Copyright © 2018 Bixlabs. All rights reserved.
//

import Foundation

final class HomePresenter: HomeViewDelegateInterface {
    
    // MARK: - Private Properties -
    internal var _wireframe: HomeWireframeInterface
    internal unowned var _view: HomeViewInterface
    internal var _interactor: HomeInteractorInterface?
    
    // MARK: - Lifecycle -
    init(wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorInterface? = nil) {
        self._wireframe = wireframe
        self._view = view
        self._interactor = interactor
    }
    
}

extension HomePresenter {
    func didPressOK() {
        _interactor?.fetchtHomeData()
    }
}

extension HomePresenter: HomeOutputInteractorInterface {
    func onGetHomeData(_ data: HomeEntity) {
        _wireframe.navigateToNextViewController(data)
    }
}
