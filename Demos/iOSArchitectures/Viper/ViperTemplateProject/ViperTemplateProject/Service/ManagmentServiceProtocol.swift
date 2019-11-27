//
//  ManagmentServiceProtocol.swift
//  ViperTemplateProject
//
//  Created by Cris on 27/11/19.
//  Copyright © 2019 Bixlabs. All rights reserved.
//

protocol ManagmentServiceProtocol {
    var networkManager: NetworkManagerProtocol { get }
}


/// This is a demo networkManager. You should provide a better completion block.
protocol NetworkManagerProtocol {
    func execute(completion: @escaping (String) -> ())
}


struct NetworkDemoAPI: NetworkManagerProtocol {
    func execute(completion: @escaping (String) -> ()) {
        completion("HomeTitle")
    }
}
