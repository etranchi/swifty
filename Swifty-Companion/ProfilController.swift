//
//  ProfilController.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 26/12/2018.
//  Copyright © 2018 Etienne Tranchier. All rights reserved.
//

import UIKit

class ProfilController: UIViewController {

    var user : User? {
        didSet {
            setupView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        let header = HeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.user = user
        let skills = SkillsView()
        skills.translatesAutoresizingMaskIntoConstraints = false
        if user!.cursus_users != nil && user!.cursus_users!.count > 0 {
            let _ = user!.cursus_users!.first(where: { (cursus) -> Bool in
                if cursus.cursus_id == 1 {
                    
                    print("plouf")
                    skills.skills = cursus.skills
                    return true
                }
                return false
            })
        }
        self.view.addSubview(skills)
        self.view.addSubview(header)
        let padding : CGFloat = 20
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.widthAnchor.constraint(equalTo: view.widthAnchor),
            header.heightAnchor.constraint(equalToConstant: 350),
            
            skills.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skills.widthAnchor.constraint(equalTo: view.widthAnchor),
            skills.heightAnchor.constraint(equalToConstant: 350),
            skills.topAnchor.constraint(equalTo: header.bottomAnchor)
            
            ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
