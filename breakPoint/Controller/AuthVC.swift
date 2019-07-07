//
//  AuthVC.swift
//  breakPoint
//
//  Created by AHMED on 2/1/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit
import Firebase


class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if Auth.auth().currentUser != nil{
      dismiss(animated: true, completion: nil)
    }
  }

  @IBAction func signInWithEmailButtonWasPressed(_ sender: Any) {
    let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
    present(loginVC!, animated: true, completion: nil)
  }
  
  @IBAction func facebookSignInButtonwasPressed(_ sender: Any) {
    
  }
  
  @IBAction func googleSignInButtonWasPressed(_ sender: Any) {
    
  }
  
}
