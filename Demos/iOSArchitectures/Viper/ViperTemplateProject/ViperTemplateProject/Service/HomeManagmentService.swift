//
//  HomeManagmentService.swift
//  ViperTemplateProject
//
//  Created by Cris on 27/11/19.
//  Copyright © 2019 Bixlabs. All rights reserved.
//

import Foundation

class HomeManagmentService: ManagmentServiceProtocol {
    var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkDemoAPI()) {
        self.networkManager = networkManager
    }
    
    func getHomeData(success: @escaping (HomeEntity) -> ()) {
        networkManager.execute { (result) in
            let entity = HomeEntity(title: result)
            success(entity)
        }
    }
}
