//
//  SkillsView.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 26/12/2018.
//  Copyright © 2018 Etienne Tranchier. All rights reserved.
//

import UIKit

class SkillsView: UIView {
    let skillCellId = "SkillCellId"
    var skills : [Skills]? {
        didSet {
            setupView()
            
        }
    }
    var tableView = UITableView()
    
    let name : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor.gray
        lb.textAlignment = .left
        lb.text = "Skills"
        return lb
    }()
    
    func setupView() {
        self.backgroundColor = UIColor.gray
        tableView.register(SkillCell.self, forCellReuseIdentifier: skillCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            name.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: name.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            ])
        tableView.reloadData()
    }

}

extension SkillsView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills != nil ? skills!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: skillCellId) as! SkillCell
        cell.skill = skills?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
