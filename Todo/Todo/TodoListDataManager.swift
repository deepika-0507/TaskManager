//
//  TodoListDataManager.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 04/09/23.
//

import Foundation

class TodoListDataManager {
    let filename = "TodoTaskdData.json"
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func storeDataToFile(taskModel: TaskModel) {
        let fileURL = getDocumentsDirectory().appendingPathComponent(filename)
        do {
            let jsconEcoder = JSONEncoder()
            let jsonData = try jsconEcoder.encode(taskModel)
//            var fetchedData = getStoredTaskFromFile()
//            fetchedData.append(taskModel)
            
            try jsonData.write(to: fileURL)
            print("saved data")
        } catch {
            print("Error encoding Data \(error)")
        }
    }
    
    func getStoredTaskFromFile() -> [TaskModel] {
        let fileURL = getDocumentsDirectory().appending(path: filename)
        do {
            let jsonData = try Data(contentsOf: fileURL)
            print("data: \(jsonData)")
            let decodedJson = try JSONDecoder().decode([TaskModel].self, from: jsonData)
            return decodedJson
        } catch {
            print("error fetching Data \(error)")
        }
        return TaskModel.defaultTasks
    }
    
}
