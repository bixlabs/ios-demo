//
//  EpicTaskViewModel.swift
//  SwiftUIExample
//
//  Created by pc-laptop on 09/26/19.
//  Copyright © 2019 Ingrid Guerrero. All rights reserved.
//

import Foundation
import Combine

class EpicTaskViewModel: ObservableObject {
    @Published var epicTasks: [EpicTask] = [EpicTask]()
}
