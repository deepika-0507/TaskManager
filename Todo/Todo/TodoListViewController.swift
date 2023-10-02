//
//  TodoListViewController.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 19/08/23.
//

import Foundation
import UIKit

class TodoListViewController: UIViewController {
    
    var tableView = UITableView(frame: CGRectZero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        view.backgroundColor = .clear
        tableView.register(TodoListCellView.self, forCellReuseIdentifier: String(describing: TodoListCellView.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
    }
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskModel.defaultTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(TodoListCellView.self, for: indexPath)
        cell.selectionStyle = .none
        cell.task = TaskModel.defaultTasks[indexPath.row]
        cell.setupData()
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50.0
//    }
    
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not deque cell of type \(String(describing: T.self))")
        }
        return cell
    }
    
    
}
