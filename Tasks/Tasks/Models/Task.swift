//
//  Task.swift
//  Tasks
//
//  Created by Conor Fleming on 7/30/20.
//  Copyright © 2020 Conor Fleming. All rights reserved.
//

import Foundation

struct Task : Identifiable{
    let id = UUID()
    var name: String
    var completed = false
}
