//
//  TaskModel.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 19/08/23.
//

import Foundation

struct TaskModel: Codable {
    let title: String
    let description: String
}

extension TaskModel {
    static var defaultTasks: [TaskModel] = [
        TaskModel(title: "task 1", description: "task 1 desc"),
        TaskModel(title: "task 2", description: "task 2 descr"),
        TaskModel(title: "task 11", description: "task 1 desc"),
        TaskModel(title: "task 12", description: "task 1 desc"),
        TaskModel(title: "task 13", description: "task 1 desc"),
        TaskModel(title: "task 14", description: "task 1 desc"),
        TaskModel(title: "task 15", description: "task 1 desc"),
        TaskModel(title: "task 16", description: "task 1 desc"),
        TaskModel(title: "task 17", description: "task 1 desc"),
        TaskModel(title: "task 19", description: "task 1 desc"),
        TaskModel(title: "task 18", description: "task 1 desc"),
        TaskModel(title: "task 122", description: "task 1 desc"),
        TaskModel(title: "task 133", description: "task 1 desc"),
        TaskModel(title: "task 155", description: "task 1 desc"),
        TaskModel(title: "task 177", description: "task 1 desc"),
        TaskModel(title: "task 188", description: "task 1 desc"),
        TaskModel(title: "task 100", description: "task 1 desc"),
        TaskModel(title: "task 1121", description: "task 1 desc"),
        TaskModel(title: "task 166", description: "task 1 desc")
    ]
}
