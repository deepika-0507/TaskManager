//
//  TodoListVew.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 18/08/23.
//

import Foundation
import UIKit

class TodoListView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .insetGrouped)
        tableView.backgroundColor = .purple.withAlphaComponent(0.2)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
                
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: -32),
            tableView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
