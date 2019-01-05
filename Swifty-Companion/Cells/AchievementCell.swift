//
//  AchievementCell.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 04/01/2019.
//  Copyright © 2019 Etienne Tranchier. All rights reserved.
//

import UIKit

class AchievementCell: UITableViewCell {
    var a : Achievement? {
        didSet {
            if a != nil {
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
        name.text = a!.name
        
        if a!.nbr_of_success != nil {
            name.text = a!.name + (" - Lvl " + String(a!.nbr_of_success!))
        }
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
