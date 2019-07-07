//
//  GroupFeedCell.swift
//  breakPoint
//
//  Created by AHMED on 2/7/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
  
  @IBOutlet weak var emailLbl: UILabel!
  @IBOutlet weak var contentLbl: UILabel!
  @IBOutlet weak var profileImage: UIImageView!
  
  func configurecell(profileImage: UIImage, email: String, content: String){
    self.profileImage.image = profileImage
    self.contentLbl.text = content
    self.emailLbl.text = email
    
  }
}
