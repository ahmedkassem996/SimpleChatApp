//
//  MeVC.swift
//  breakPoint
//
//  Created by AHMED on 2/4/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var emailLbl: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.emailLbl.text = Auth.auth().currentUser?.email
  }

  @IBAction func signOutButtonWasPressed(_ sender: Any) {
    let logOutPopUp = UIAlertController(title: "logOut?", message: "Are you sure you want logOut", preferredStyle: .actionSheet)
    let logOutAction = UIAlertAction(title: "logOut?", style: .destructive) { (buttonTapped) in
      do{
        try Auth.auth().signOut()
        let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC")
        self.present(authVC!, animated: true, completion: nil)
      }catch{
        print(error)
      }
    }
    logOutPopUp.addAction(logOutAction)
    present(logOutPopUp, animated: true, completion: nil)
  }
  
}
