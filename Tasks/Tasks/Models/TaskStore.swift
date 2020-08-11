//
//  TaskStore.swift
//  Tasks
//
//  Created by Conor Fleming on 7/30/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import Combine

class TaskStore: ObservableObject{
    /*@Published var tasks = ["go ride bike",
                 "make dinner",
                 "clean",
                 "code",
                 "chill",
                 "get a new job",
                 "visit whistler"].map{ Task(name: $0)}*/

    
    @Published var prioritizedTasks = [
        PrioritizedTasks(priority: .high, names: [
            "get a new job",
            "get a new job",
            "get a new job",
            "get a new job",
            "get a new job",
            "get a new job"
            ]),
        PrioritizedTasks(priority: .medium, names: [
             "code",
             "go rip",
             "drink clawski"
            ]),
        PrioritizedTasks(priority: .low, names: [
            "chill",
            "visit whistler",
            "make dinner"
        ]),
        PrioritizedTasks(priority: .no, names: [
         "game"
            ]
        )
    ]
}


private extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            Tasks: names.map { Task(name: $0) }
        )
    }
}
