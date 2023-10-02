//
//  TodoListSubView.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 25/08/23.
//

import Foundation
import UIKit

class TodoListSubView: UIView {
    
    var task: TaskModel?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26.0, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    let vStackView: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    init(task: TaskModel?) {
        super.init(frame: .zero)
        self.task = task
        
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(descriptionLabel)
        
        self.addSubview(vStackView)
        setDetails()
        
        NSLayoutConstraint.activate([
            vStackView.widthAnchor.constraint(equalTo: self.widthAnchor),
            vStackView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDetails() {
        titleLabel.text = task?.title
        descriptionLabel.text = task?.description
    }
}
