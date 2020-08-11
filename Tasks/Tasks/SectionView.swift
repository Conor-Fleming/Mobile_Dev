//
//  SectionView.swift
//  Tasks
//
//  Created by Conor Fleming on 8/8/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioritizedTasks: TaskStore.PrioritizedTasks
    
    var body: some View {
        ForEach(
              Array( prioritizedTasks.tasks.enumerated() ),
              id: \.element.id
            ) { index, _ in
              RowView(task: self.$prioritizedTasks.tasks[index])
            }
            .onMove { sourceIndices, destinationIndex in
                self.prioritizedTasks.tasks.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
                
            }
            .onDelete { indexSet in
                self.prioritizedTasks.tasks.remove(atOffsets: indexSet)
        }
    }
}



