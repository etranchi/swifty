//
//  ProjectsView.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 03/01/2019.
//  Copyright © 2019 Etienne Tranchier. All rights reserved.
//

import UIKit

class ProjectsView: UIView {
    let projectCellId = "ProjectCellId"
    var projects : [Project_user]? {
        didSet {
            setupView()
            
        }
    }
    var tableView = UITableView()
    
    let name : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor.black
        lb.textAlignment = .left
        lb.text = "Projects"
        return lb
    }()
    
    func setupView() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tableView.register(ProjectCell.self, forCellReuseIdentifier: projectCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: name.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            ])
        tableView.reloadData()
    }
    
}

extension ProjectsView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects != nil ? projects!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: projectCellId) as! ProjectCell
        cell.project = projects?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
