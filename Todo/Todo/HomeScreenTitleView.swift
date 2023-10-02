//
//  HomeScreenTitleView.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 18/08/23.
//

import Foundation
import UIKit

class HomeScreenTitleView: UIView {
    
    lazy var todoListView = TodoListView()
    
    static var dateFormater: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }
    
    var dateTitle: UILabel = {
        let label = UILabel()
        let currentDate = Date.now
        label.text = dateFormater.string(from: currentDate)
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    var titleView: UILabel = {
        let label = UILabel()
        label.text = "My Todo List"
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple.withAlphaComponent(0.7)
        stackView.addArrangedSubview(dateTitle)
        stackView.addArrangedSubview(titleView)
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
