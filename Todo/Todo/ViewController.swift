//
//  ViewController.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 18/08/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var titleView = HomeScreenTitleView()
    lazy var todoListView = TodoListView()
    lazy var todoListViewController = TodoListViewController()
    lazy var todoScrollView = TodoListScrollView()
    lazy var completedScrollView = TodoListScrollView()
    var secondViewController = SecondScreenViewController()
    
    var completedTasksTitle: UILabel = {
        let label = UILabel()
        label.text = "Completed Texts"
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var addTasksButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Tasks", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action:#selector(continueButtonPressed(_:)) , for: .touchUpInside)
        return button
    }()
    
    @objc
    private func continueButtonPressed(_ sender:Any) {
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        titleView.translatesAutoresizingMaskIntoConstraints =  false
        todoListView.translatesAutoresizingMaskIntoConstraints = false
        todoScrollView.translatesAutoresizingMaskIntoConstraints = false
        completedScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.insertSubview(titleView, at: 0)
        NSLayoutConstraint.activate([
            titleView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        view.addSubview(todoScrollView)
                
        NSLayoutConstraint.activate([
            todoScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            todoScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoScrollView.heightAnchor.constraint(equalToConstant: 250),
            todoScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 135)
        ])
        
        view.addSubview(completedTasksTitle)
        
        NSLayoutConstraint.activate([
            completedTasksTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            completedTasksTitle.topAnchor.constraint(equalTo: todoScrollView.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(completedScrollView)

        NSLayoutConstraint.activate([
            completedScrollView.topAnchor.constraint(equalTo: completedTasksTitle.bottomAnchor, constant: 20),
            completedScrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            completedScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completedScrollView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        view.addSubview(addTasksButton)
        
        NSLayoutConstraint.activate([
            addTasksButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            addTasksButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            addTasksButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTasksButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)

    }

}

