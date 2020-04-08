//
//  RootVC.swift
//  
//
//  Created by shekar ramaswamy on 4/8/20.
//

import Foundation
import UIKit
import SCSDKLoginKit

class LoginVC: UIViewController {
    
    var loginButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupLoginButton()
        
        print(SCSDKLoginClient.isUserLoggedIn)
    }
    
    func setupLoginButton() {
        self.view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.setTitle("Login with snapchat", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = .yellow
        loginButton.layer.cornerRadius = 20

        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        loginButton.addTarget(self, action: #selector(loginWithSnapchat), for: .touchUpInside)
    }
}

extension LoginVC {
    
    @objc func loginWithSnapchat() {
        SCSDKLoginClient.login(from: self) { (success: Bool, error: Error?) in
            if success {
                self.requestLoginAndHandle()
            }
            if let error = error {
                print("loginWithSnapchat \(error)")
            }
        }
    }
    
    func requestLoginAndHandle() {
        let successBlock = { (response: [AnyHashable: Any]?) in
            guard let response = response as? [String: Any],
                let data = response["data"] as? [String: Any],
                let me = data["me"] as? [String: Any],
                let displayName = me["displayName"] as? String,
                let bitmoji = me["bitmoji"] as? [String: Any],
                let avatar = bitmoji["avatar"] as? String else {
                    return
            }
            
            print("Display name")
            print(displayName)
        }
        
        let failureBlock = { (error: Error?, success: Bool) in
            if let error = error {
                print(String.init(format: "Failed to fetch user data. Details: %@", error.localizedDescription))
            }
        }
        
        let queryString = "{me{externalId, displayName, bitmoji{avatar}}}"
        SCSDKLoginClient.fetchUserData(withQuery: queryString,
                                       variables: nil,
                                       success: successBlock,
                                       failure: failureBlock)
    }
}
