//
//  todoListScrollView.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 25/08/23.
//

import Foundation
import UIKit

class TodoListScrollView: UIView {
    
    let dataManager = TodoListDataManager()
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        scrollView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        for task in dataManager.getStoredTaskFromFile() {
            let subView = TodoListSubView(task: task)
            subView.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(subView)
            NSLayoutConstraint.activate([
                subView.leftAnchor.constraint(equalTo: stack.leftAnchor, constant: 16)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
