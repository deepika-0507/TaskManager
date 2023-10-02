//
//  SecondScreenViewController.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 28/08/23.
//

import Foundation
import UIKit

class SecondScreenViewController: UIViewController {
    
    var titleTextField: UITextField?
    var descriptionTextField: UITextField?
    
    var totalstackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var firstSubView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    var descriptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    var secondSubView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Task", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func createInputField(height: CGFloat, placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.backgroundColor = .purple.withAlphaComponent(0.2)
        textField.heightAnchor.constraint(equalToConstant: height).isActive = true
        textField.borderStyle = .roundedRect
        return textField
    }
    
    func createFirstSubView() -> UIStackView {
        let view = firstSubView
        let label = UILabel()
        label.text = "Task title"
        label.textColor = .black
        
        titleTextField = createInputField(height: 55.0, placeholder: "Add Title")
        view.addArrangedSubview(label)
        view.addArrangedSubview(titleTextField ?? UITextField())
        return view
    }
    
    func createSecondSubView() -> UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        
        let label = UILabel()
        label.text = "Category"
        label.textColor = .black
        
        view.addArrangedSubview(label)
        view.addArrangedSubview(createImageView(name: "graduationcap.circle", color: .gray))
        view.addArrangedSubview(createImageView(name: "house.circle", color: .systemOrange.withAlphaComponent(0.4)))
        view.addArrangedSubview(createImageView(name: "calendar.circle", color: .blue.withAlphaComponent(0.6)))
        view.addArrangedSubview(createImageView(name: "person.circle", color: .systemGreen.withAlphaComponent(0.7)))

        return view
    }
    
    func createDescriptionView() -> UIStackView {
        let stackView = descriptionStackView
        let label = UILabel()
        label.text = "Add notes"
        
        descriptionTextField = createInputField(height: 150, placeholder: "Descripte your task")
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(descriptionTextField ?? UITextField())
        return stackView
    }
    
    func createImageView(name: String, color: UIColor) -> UIButton {
        let image = UIImage(systemName: name)?.withRenderingMode(.alwaysTemplate)
        let imageSelected = UIImage(systemName: "\(name).fill")?.withRenderingMode(.alwaysOriginal)
        let button = UIButton(type: .roundedRect)
        button.setBackgroundImage(image, for: .normal)
        button.setBackgroundImage(imageSelected, for: .selected)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.tintColor = color
        button.addTarget(self, action:#selector(categoryButtonAction(_:)), for: .touchUpInside)
        return button
    }
    
    @objc
    private func categoryButtonAction(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        title = "Add a Task"
        
        let firstView = createFirstSubView()
        let secondView = createSecondSubView()
        let descriptionView = createDescriptionView()
        submitButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
        
        view.addSubview(totalstackView)
        
        totalstackView.addArrangedSubview(firstView)
        totalstackView.addArrangedSubview(secondView)
        totalstackView.addArrangedSubview(descriptionView)
        totalstackView.addArrangedSubview(submitButton)
        
        NSLayoutConstraint.activate([
            totalstackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            totalstackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totalstackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            submitButton.widthAnchor.constraint(equalTo: totalstackView.widthAnchor),
            submitButton.bottomAnchor.constraint(equalTo: totalstackView.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = .systemPurple
        self.navigationController?.navigationBar.scrollEdgeAppearance?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        titleTextField?.text?.removeAll()
        descriptionTextField?.text?.removeAll()
    }
    
    @objc
    func submitButtonAction() {
        guard let title = titleTextField?.text, let description = descriptionTextField?.text,
        title != "", description != "" else {
            return
        }
        let taskData = TaskModel(title: title, description: description)
        
        let dataMagaer = TodoListDataManager()
        dataMagaer.storeDataToFile(taskModel: taskData)
        navigationController?.popViewController(animated: true)
    }
    
}
