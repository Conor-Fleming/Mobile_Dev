//
//  TaskEditingView.swift
//  Tasks
//
//  Created by Conor Fleming on 8/7/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import SwiftUI

struct TaskEditingView: View {
    @Binding var task: Task
    var body: some View {
        Form{
            TextField("Name", text: $task.name)
            Toggle("Completed", isOn: $task.completed)
        }
    }
}

struct TaskEditingView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditingView(
            task: .constant(Task(name: "To do"))
        )
    }
}
