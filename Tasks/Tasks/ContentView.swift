//
//  ContentView.swift
//  Tasks
//
//  Created by Conor Fleming on 7/30/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore: TaskStore
    @State var modalIsPresented = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(
                  Array( taskStore.tasks.enumerated() ),
                  id: \.element.id
                ) { index, _ in
                  RowView(task: self.$taskStore.tasks[index])
                }
                .onMove { sourceIndices, destinationIndex in
                    self.taskStore.tasks.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
                    
                }
                .onDelete { indexSet in
                    self.taskStore.tasks.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {self.modalIsPresented = true}
                ){
                    Image(systemName: "plus")
            })
            .sheet(isPresented: $modalIsPresented) {
                NewTasKView(taskStore: self.taskStore)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}

