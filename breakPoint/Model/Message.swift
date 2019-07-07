//
//  Message.swift
//  breakPoint
//
//  Created by AHMED on 2/5/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import Foundation


class Message{
  
  private var _content: String
  private var _senderId: String
  
  var content:String{
    return _content
  }
  
  var senderId: String{
    return _senderId
  }
  
  init(content: String, senderId: String) {
    self._content = content
    self._senderId = senderId
  }

}
