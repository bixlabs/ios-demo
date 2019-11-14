//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by pc-laptop on 09/26/19.
//  Copyright © 2019 Ingrid Guerrero. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var viewModel: EpicTaskViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.epicTasks) { epicTask in
                    EpicTaskView(epicTask: epicTask)
                }
                .navigationBarTitle("Epic Task")
                .navigationBarItems(trailing:  NavigationLink(destination: AddNewTaskView(), label: {
                    Image(systemName: "plus.circle")
                })  )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EpicTaskViewModel())
    }
}
