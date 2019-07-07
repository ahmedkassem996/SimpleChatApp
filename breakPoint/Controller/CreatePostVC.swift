//
//  CreatePostVC.swift
//  breakPoint
//
//  Created by AHMED on 2/4/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
  
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var emailLbl: UILabel!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var sendButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      textView.delegate = self
      sendButton.bindToKeyboard()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.emailLbl.text = Auth.auth().currentUser?.email
  }
  
  @IBAction func sendButtonWasPressed(_ sender: Any) {
    if textView.text != nil && textView.text != "Say something here..."{
      sendButton.isEnabled = false
      DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
        if isComplete{
          self.sendButton.isEnabled = true
          self.dismiss(animated: true, completion: nil)
        }else{
          self.sendButton.isEnabled = true
          print("There was an error!")
        }
      }
    }
  }
  
  @IBAction func closeButtonwasPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
}

extension CreatePostVC: UITextViewDelegate{
  func textViewDidBeginEditing(_ textView: UITextView) {
    textView.text = ""
  }
}
