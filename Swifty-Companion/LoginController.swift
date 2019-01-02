//
//  LoginController.swift
//  Swifty-Companion
//
//  Created by Etienne Tranchier on 24/12/2018.
//  Copyright © 2018 Etienne Tranchier. All rights reserved.
//

import UIKit

public func makeAlert(_ msg : String) {
    // to check
    if let cont = UIApplication.shared.keyWindow?.rootViewController?.children.last {
        let al = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        al.addAction(UIAlertAction(title: "Ok", style: .default, handler: { me in
            al.dismiss(animated: true, completion: nil)
        }))
        cont.present(al, animated: true, completion: nil)
    }
    
}

class LoginController: UIViewController , URLSessionDelegate {
    let jsonEncoder = JSONEncoder()
    var CREDENTIALS : CRED?
    
    let button : UIButton = {
        let b = UIButton(type: .roundedRect)
        b.layer.cornerRadius = 25
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor(red: 0, green: 186, blue: 188, alpha: 1)
        b.setAttributedTitle(NSAttributedString(string: "Go", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        return b
    }()
    
    let login : UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.gray
        tf.layer.cornerRadius = 25
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderColor = UIColor(red: 0, green: 186, blue: 188, alpha: 1).cgColor
        tf.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        tf.textColor = UIColor.white
        return tf
    }()
    
    @objc func goToProfile() {
        guard login.text != "", CREDENTIALS != nil else {
            makeAlert("This is empty..")
            return
        }
        getUser(login.text!.lowercased()) { (ret) in
            if ret != nil {
                // push profile view
                let profile = ProfilController()
                profile.user = ret
                self.present(profile, animated: true, completion: nil)
            }
        }
    }
    
    
    func setupView() {
        view.addSubview(login)
        view.addSubview(button)
        button.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        
        let middle = view.bounds.height / 2 - 20
        let padding = 20

        NSLayoutConstraint.activate([
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            login.heightAnchor.constraint(equalToConstant: 50),
            login.topAnchor.constraint(equalTo: view.topAnchor, constant: (middle - CGFloat(padding))),
            
            button.topAnchor.constraint(equalTo: login.bottomAnchor, constant: CGFloat(2 * padding)),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalTo: login.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func getToken(completion : @escaping((CRED?) -> ())) {
        let url = URL(string:"https://api.intra.42.fr/oauth/token?grant_type=client_credentials&client_id=172e47e5ee6ed901ef37ca6a0f7644c0adaf14b00b7b8697abaa72bb44063dfa&client_secret=15b36506ad3cab8bb8a159e2b4480492199072df8a31ebb868f59abd44f6276a&redirect_uri=etranchi.Swifty-Companion%3A%2F%2Fauthorize&response_type=code")
        
        var req = URLRequest(url: url!)
        req.httpMethod = "POST"
        doIt(req: req, type: CRED.self, completion: { (ret) in
            print(ret?.access_token)
            completion(ret)
        })
    }

    
    func getUser(_ search : String, completion: @escaping ((User?) -> ())) {
        print(search)
        let w = search.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url = URL(string: "https://api.intra.42.fr/v2/users/\(w)")
        var req = URLRequest(url: url!)
        req.httpMethod = "GET"
        req.setValue("Bearer \(CREDENTIALS!.access_token)", forHTTPHeaderField: "Authorization")
        doIt(req: req, type: User.self) { (ret) in
            completion(ret)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImage(named: "background42")
        getToken(completion: { (ret) in
            if ret != nil {
                self.CREDENTIALS = ret
            }
        })
        view.backgroundColor = UIColor(patternImage: background!)
        setupView()
        // Do any additional setup after loading the view.
    }
    

    func doIt<T : Decodable>(req: URLRequest, type : T.Type, completion: @escaping((T?) -> ())) {
        URLSession(configuration: .default, delegate: self, delegateQueue: .main).dataTask(with: req) { (data, response, err) in
            if err != nil {
                print("No response from the server, try again..")
                completion(nil)
            }
            if let d = data {
                do {
                    let ret = try JSONDecoder().decode(T.self, from: d)
                    completion(ret)
                }
                catch (let err){
                    print(err.localizedDescription)
                    completion(nil)
                }
            }
            }.resume()
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
