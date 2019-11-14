//
//  EpicTaskView.swift
//  SwiftUIExample
//
//  Created by pc-laptop on 09/26/19.
//  Copyright © 2019 Ingrid Guerrero. All rights reserved.
//

import SwiftUI

struct EpicTaskView: View {
    var epicTask: EpicTask
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(epicTask.epicName).font(.title).fontWeight(.bold)
                Text("Due date: \(epicTask.dueDate)").font(.subheadline)
            }
        .padding()
        }
        .foregroundColor(.white)
        .background(Color.lightBlue)
        .cornerRadius(10)
        .padding()
    }
}

struct EpicTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EpicTaskView(epicTask: EpicTask(tasks: [task1, task2], epicName: "Epic # 1", dueDate: Date()))
    }
}

extension UIColor {
    static let lightBlue = UIColor(red: 0, green: 0.9098, blue: 0.7725, alpha: 1.0)
}

extension Color {
    static let lightBlue = Color(.lightBlue)
}
