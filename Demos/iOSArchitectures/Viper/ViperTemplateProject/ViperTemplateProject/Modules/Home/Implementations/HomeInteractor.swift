//
//  HomeInteractor.swift
//  ViperTemplateProject
//
//  Created by Matias Radzinski on 12/17/18.
//  Copyright © 2018 Bixlabs. All rights reserved.
//

import Foundation

final class HomeInteractor : HomeInteractorInterface {
    var presenter: HomeOutputInteractorInterface?
    
    var homeManagmentService: HomeManagmentService
    
    init() {
        homeManagmentService = HomeManagmentService()
    }
    
    func fetchtHomeData() {
        homeManagmentService.getHomeData { (homeEntity) in
            self.presenter?.onGetHomeData(homeEntity)
        }
    }
}
