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
    
    @objc func dissmisView() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let background = UIImage(named: "background42")
        view.backgroundColor = UIColor(patternImage: background!)
        let scroll = UIScrollView(frame: self.view.bounds)
        scroll.contentSize = CGSize(width: self.view.frame.width, height: 1400)
        let header = HeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.user = user
        let skills = SkillsView()
        skills.translatesAutoresizingMaskIntoConstraints = false
        let projects = ProjectsView()
        projects.translatesAutoresizingMaskIntoConstraints = false
        let achiev = AchievementsView()
        achiev.translatesAutoresizingMaskIntoConstraints = false
        if user!.achievements != nil {
            achiev.achievements = user!.achievements
        }
        if user!.projects_users != nil && user!.projects_users!.count > 0 {
            let ret = user!.projects_users!.filter({ (proj) -> Bool in
                if proj.cursus_ids != nil && proj.cursus_ids![0] == 1 {
                    return true
                }
                return false
            })
            projects.projects = ret
            
        }
        if user!.cursus_users != nil && user!.cursus_users!.count > 0 {
            let _ = user!.cursus_users!.first(where: { (cursus) -> Bool in
                if cursus.cursus_id == 1 {
                    skills.skills = cursus.skills
                    return true
                }
                return false
            })
        }
        
        scroll.addSubview(skills)
        scroll.addSubview(header)
        scroll.addSubview(projects)
        scroll.addSubview(achiev)
        self.view.addSubview(scroll)
        
        NSLayoutConstraint.activate([            
            header.topAnchor.constraint(equalTo: scroll.topAnchor),
            header.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            header.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            header.heightAnchor.constraint(equalToConstant: 350),
            
            skills.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            skills.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            skills.heightAnchor.constraint(equalToConstant: 350),
            skills.topAnchor.constraint(equalTo: header.bottomAnchor),
            
            projects.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            projects.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            projects.heightAnchor.constraint(equalToConstant: 350),
            projects.topAnchor.constraint(equalTo: skills.bottomAnchor),
            
            achiev.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            achiev.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            achiev.heightAnchor.constraint(equalToConstant: 350),
            achiev.topAnchor.constraint(equalTo: projects.bottomAnchor)
            
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

extension ProfilController : UIScrollViewDelegate {
    
}
