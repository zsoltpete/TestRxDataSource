//
//  PeopleViewModel.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleViewModel: NSObject {
    
    var userName: Variable<String> = Variable("")
    var age: Variable<Int> = Variable(0)
    
    init(userName: String, age: Int) {
        self.userName.value = userName
        self.age.value = age
        super.init()
    }
    
    public static func ==(lhs: PeopleViewModel, rhs: PeopleViewModel) -> Bool {
        return true
    }
    
    override init() {
        self.userName.value = ""
        self.age.value = 0
        super.init()
    }

}
