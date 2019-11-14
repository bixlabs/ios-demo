//
//  AddNewTaskView.swift
//  SwiftUIExample
//
//  Created by pc-laptop on 09/26/19.
//  Copyright © 2019 Ingrid Guerrero. All rights reserved.
//

import SwiftUI

struct AddNewTaskView: View {
    @EnvironmentObject var viewModel: EpicTaskViewModel
    @Environment(\.presentationMode) var presentation
    
    @State private var taskName = ""
    @State private var taskDueDate = Date()
    
    var body: some View {
        VStack {
            List {
                TextField("Name: ", text: $taskName).padding()
                DatePicker("Selecte task due date", selection: $taskDueDate).padding()
                Button(action: {
                    let newTask = EpicTask(tasks: [task1, task2],
                                           epicName: self.taskName,
                                           dueDate: self.taskDueDate)
                    self.viewModel.epicTasks.append(newTask)
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Save Task")
                }
            }
            .listStyle(GroupedListStyle())
            
        }
        .navigationBarTitle("Add New Task")
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
    }
}
