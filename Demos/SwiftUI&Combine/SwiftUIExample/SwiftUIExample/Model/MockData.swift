//
//  MockData.swift
//  SwiftUIExample
//
//  Created by pc-laptop on 09/26/19.
//  Copyright © 2019 Ingrid Guerrero. All rights reserved.
//

import Foundation

let user = User(name: "CrisG.")
let task1 = Task(user: user, taskName: "task mocked 1", taskDescription: "lorem ipsum", taskHours: 10)
let task2 = Task(user: user, taskName: "task mocked 2", taskDescription: "lorem ipsum", taskHours: 10)
let mockedEpicTask = [EpicTask(tasks: [task1, task2], epicName: "Epic # 1", dueDate: Date()),
                      EpicTask(tasks: [task1, task2], epicName: "Epic # 2", dueDate: Date()),
                      EpicTask(tasks: [task1, task2], epicName: "Epic # 3", dueDate: Date())]
