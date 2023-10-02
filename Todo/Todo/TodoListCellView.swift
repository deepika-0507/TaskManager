//
//  TodoListCellView.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 19/08/23.
//

import Foundation
import UIKit

class TodoListCellView: UITableViewCell {
    
    var task: TaskModel?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26.0, weight: .semibold)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        return label
    }()
    
    let vStackView: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .blue
        
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(descriptionLabel)
        
        self.addSubview(vStackView)
        
        NSLayoutConstraint.activate([
            vStackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -16),
            vStackView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -16),
            vStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            vStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    func setupData() {
        titleLabel.text = task?.title
        descriptionLabel.text = task?.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
