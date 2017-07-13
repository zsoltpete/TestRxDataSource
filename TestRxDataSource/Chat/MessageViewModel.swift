//
//  MessageViewModel.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MessageViewModel: NSObject {

    var message: Variable<String> = Variable("")
    var partner: Variable<Bool> = Variable(false)
    
    init(message: String, partner: Bool) {
        self.message.value = message
        self.partner.value = partner
        super.init()
    }
    
    override init() {
        self.message.value = ""
        self.partner.value = false
        super.init()
    }
    
}
