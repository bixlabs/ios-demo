//
//  EpicTask.swift
//  SwiftUIExample
//
//  Created by pc-laptop on 09/26/19.
//  Copyright © 2019 Ingrid Guerrero. All rights reserved.
//

import Foundation

struct EpicTask: Identifiable {
    var id: String {
        return epicName
    }
    let tasks: [Task]
    let epicName: String
    let dueDate: Date
}
