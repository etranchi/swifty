//
//  SkillCell.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 26/12/2018.
//  Copyright © 2018 Etienne Tranchier. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell {
    var skill : Skills? {
        didSet {
            if skill != nil {
                setupView()
            }
        }
    }
    let name : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor.gray
        lb.textAlignment = .left
        lb.numberOfLines = 1
        return lb
    }()
    
    let progress : UIProgressView = {
        let p = UIProgressView()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.progressTintColor = UIColor.green
        return p
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setupView() {
        addSubview(name)
        addSubview(progress)
        name.text = skill!.name + " - level \(String(skill!.level))"
        progress.progress = skill!.level.truncatingRemainder(dividingBy: 1)
        let padding : CGFloat = 5
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            name.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            name.widthAnchor.constraint(equalTo: widthAnchor),
            
            progress.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding),
            progress.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            progress.widthAnchor.constraint(equalTo: widthAnchor),
            progress.centerXAnchor.constraint(equalTo: centerXAnchor)
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
