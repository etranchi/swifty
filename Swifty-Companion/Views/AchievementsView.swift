//
//  AchievementsView.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 04/01/2019.
//  Copyright © 2019 Etienne Tranchier. All rights reserved.
//

import UIKit

class AchievementsView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let achievementCellId = "ACellId"
    var achievements : [Achievement]? {
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
        lb.text = "Achievements"
        return lb
    }()
    
    func setupView() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tableView.register(AchievementCell.self, forCellReuseIdentifier: achievementCellId)
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

extension AchievementsView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  achievements!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: achievementCellId) as! AchievementCell
        cell.a = achievements![indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


