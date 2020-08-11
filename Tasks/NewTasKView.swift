//
//  NewTasKView.swift
//  Tasks
//
//  Created by Conor Fleming on 7/31/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import SwiftUI

struct NewTasKView: View {
    var taskStore: TaskStore
    
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    
    var body: some View {
        Form{
            TextField("Task Name", text: $text)
                Button("Add"){
                    self.taskStore.tasks.append(Task(name: self.text))
                    self.presentationMode.wrappedValue.dismiss()
            }.disabled(text.isEmpty)
        }
    }
}

struct NewTasKView_Previews: PreviewProvider {
    static var previews: some View {
        NewTasKView(taskStore: TaskStore())
    }
}
