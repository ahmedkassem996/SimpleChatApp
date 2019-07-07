//
//  GroupCell.swift
//  breakPoint
//
//  Created by AHMED on 2/6/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
  
  @IBOutlet weak var groupTitleLbl: UILabel!
  @IBOutlet weak var groupDescLbl: UILabel!
  @IBOutlet weak var memberCountLbl: UILabel!
  
  
  func configureCell(title: String, description: String, memberCount: Int){
    self.groupTitleLbl.text = title
    self.groupDescLbl.text = description
    self.memberCountLbl.text = "\(memberCount) members."
   }
  
}
