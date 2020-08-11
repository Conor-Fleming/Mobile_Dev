//
//  TaskStore.PrioritizedTasks.swift
//  Tasks
//
//  Created by Conor Fleming on 8/8/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

extension TaskStore{
    struct PrioritizedTasks {
        let priority: Task.Priority
        var Tasks:[Task]
    }
}

extension TaskStore.PrioritizedTasks: Identifiable{
    var id: Task.Priority{priority}
}
