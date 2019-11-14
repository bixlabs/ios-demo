//
//  Task.swift
//  SwiftUIExample
//
//  Created by pc-laptop on 09/26/19.
//  Copyright © 2019 Ingrid Guerrero. All rights reserved.
//

import Foundation

enum TaskType {
    case backlog
    case inProgress
    case done
}


struct Task {
    let user: User
    let taskName: String
    let taskDescription: String
    let taskHours: Int
    let taskType: TaskType = .backlog
}
