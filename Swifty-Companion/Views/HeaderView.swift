//
//  HeaderView.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 26/12/2018.
//  Copyright © 2018 Etienne Tranchier. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var user : User? {
        didSet {
            let url = URL(string: user!.image_url)
            let data = try? Data(contentsOf: url!)
            self.img.image = UIImage(data: data!)
            self.setupConstraint()
        }
    }
    
    
    let progress : UIProgressView = {
        let p = UIProgressView()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.progressTintColor = UIColor.green
        return p
    }()
    
    let img: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.layer.masksToBounds = true
        iv.isUserInteractionEnabled = false
        return iv
    }()
    
    var level : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .center
        return lb
    }()
    
    var correction : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .right
        return lb
    }()
    
    var wallet : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .right
        return lb
    }()
    
    var phone : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .right
        return lb
    }()
    
    var login : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .right
        return lb
    }()
    
    var full_name : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.textAlignment = .left
        return lb
    }()
    
    let dissmisButton : UIButton = {
        let bt = UIButton()
        
        let img = UIImage(named: "exit")!.withRenderingMode(.alwaysTemplate)
        bt.tintColor = .white
        bt.setImage(img, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(ProfilController.dissmisView), for: .touchUpInside)
        return bt
    }()
    
    
    func setupConstraint() {
        // let background = UIImage(named: "background42")
        self.backgroundColor = .clear
        addSubview(img)
        addSubview(level)
        addSubview(full_name)
        addSubview(login)
        addSubview(phone)
        addSubview(wallet)
        addSubview(dissmisButton)
        addSubview(correction)
        addSubview(progress)
        login.text = user?.login
        phone.text = user?.phone
        if user!.cursus_users != nil && user!.cursus_users!.count > 0 {
            let _ = user!.cursus_users!.first(where: { (cursus) -> Bool in
                if cursus.cursus_id == 1 {
                    level.text = "Level : " + String(cursus.level)
                    progress.progress = cursus.level.truncatingRemainder(dividingBy: 1)
                    return true
                }
                return false
            })
        }
        wallet.text = "Wallet : \(user!.wallet)"
        correction.text = "Correction : " + String(user!.correction_point)
        full_name.text = "\(user!.displayname)"
        let padding : CGFloat = 30
        let width : CGFloat = 120
        NSLayoutConstraint.activate([
            dissmisButton.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            dissmisButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            dissmisButton.widthAnchor.constraint(equalToConstant: 40),
            dissmisButton.heightAnchor.constraint(equalToConstant: 40),
            
            img.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            img.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            img.widthAnchor.constraint(equalToConstant: width),
            img.heightAnchor.constraint(equalToConstant: width + 40),
            
            full_name.topAnchor.constraint(equalTo: img.bottomAnchor, constant: padding / 2),
            full_name.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            full_name.widthAnchor.constraint(equalToConstant: width + 50),
            full_name.heightAnchor.constraint(equalToConstant: 20),
            
            login.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            login.rightAnchor.constraint(equalTo: rightAnchor, constant: -(padding + 50)),
            login.widthAnchor.constraint(equalToConstant: width),
            login.heightAnchor.constraint(equalToConstant: 20),
            
            phone.topAnchor.constraint(equalTo: login.bottomAnchor, constant: padding),
            phone.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            phone.widthAnchor.constraint(equalToConstant: width),
            phone.heightAnchor.constraint(equalToConstant: 20),
            
            wallet.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: padding),
            wallet.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            wallet.widthAnchor.constraint(equalToConstant: width),
            wallet.heightAnchor.constraint(equalToConstant: 20),
            
            correction.topAnchor.constraint(equalTo: wallet.bottomAnchor, constant: padding),
            correction.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            correction.widthAnchor.constraint(equalToConstant: width),
            correction.heightAnchor.constraint(equalToConstant: 20),
            
            level.topAnchor.constraint(equalTo: full_name.bottomAnchor, constant: padding / 2),
            level.centerXAnchor.constraint(equalTo: centerXAnchor),
            level.widthAnchor.constraint(equalToConstant: width),
            level.heightAnchor.constraint(equalToConstant: 20),
            
            progress.topAnchor.constraint(equalTo: level.bottomAnchor, constant: padding / 2),
            progress.centerXAnchor.constraint(equalTo: centerXAnchor),
            progress.heightAnchor.constraint(equalToConstant: 5),
            progress.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7)
            ])
    }
    


}
