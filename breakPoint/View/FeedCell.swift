//
//  FeedCell.swift
//  breakPoint
//
//  Created by AHMED on 2/5/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
  
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var emailLbl: UILabel!
  @IBOutlet weak var contentLbl: UILabel!
  
  
  func configureCell(profileImage: UIImage, email:String, content: String){
    self.profileImage.image = profileImage
    self.emailLbl.text = email
    self.contentLbl.text = content
  }

}
