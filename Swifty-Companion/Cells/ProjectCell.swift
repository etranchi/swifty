//
//  ProjectCell.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 03/01/2019.
//  Copyright © 2019 Etienne Tranchier. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {
    var project : Project_user? {
        didSet {
            if project != nil {
                setupView()
            }
        }
    }
    
    let name : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor.gray
        lb.textAlignment = .center
        lb.numberOfLines = 1
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setupView() {
        addSubview(name)
        name.text = project!.project!.name + " - " + String(project!.final_mark ?? 0)
        let padding : CGFloat = 5
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            name.widthAnchor.constraint(equalTo: widthAnchor),
            name.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

