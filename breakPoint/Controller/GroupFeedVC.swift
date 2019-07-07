//
//  GroupFeedVC.swift
//  breakPoint
//
//  Created by AHMED on 2/7/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var groupTitleLbl: UILabel!
  @IBOutlet weak var memberLbl: UILabel!
  @IBOutlet weak var sendBtnView: UIView!
  @IBOutlet weak var messageTxtField: InsetTextField!
  @IBOutlet weak var sendBtn: UIButton!
  
  var group: Group?
  var groupMessages = [Message]()
  
  func initData(forGroup group: Group){
    self.group = group
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
      sendBtnView.bindToKeyboard()
    tableView.delegate = self
    tableView.dataSource = self
   
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    groupTitleLbl.text = group?.groupTitle
    DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
      self.memberLbl.text = returnedEmails.joined(separator: ",")
    }
    //memberLbl.text = group?.members.joined(separator: ",")
    
    DataService.instance.REF_GROUPS.observe(.value) { (snapShot) in
      DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
        self.groupMessages = returnedGroupMessages
        self.tableView.reloadData()
        
        if self.groupMessages.count > 0{
          self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
        }
      })
    }
  }
  
  @IBAction func sendBtnWasPressed(_ sender: Any) {
    if messageTxtField.text != ""{
      messageTxtField.isEnabled = false
      sendBtn.isEnabled = false
      DataService.instance.uploadPost(withMessage: messageTxtField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: group?.key, sendComplete: { (complete) in
        if complete{
          self.messageTxtField.text = ""
          self.messageTxtField.isEnabled = true
          self.sendBtn.isEnabled = true
        }
      })
    }
  }
  
  @IBAction func backButtonWasPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return groupMessages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell() }
    let message = groupMessages[indexPath.row]
    DataService.instance.getUserName(forUID: message.senderId) { (email) in
      cell.configurecell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
    }
    return cell
  }
  
  
  
}


