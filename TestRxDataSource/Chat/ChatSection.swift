//
//  ChatSection.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct ChatSection {
    var header: String
    var items: [MessageViewModel]
}

extension ChatSection : SectionModelType {
    
    var identity: String {
        return header
    }
    
    init(original: ChatSection, items: [MessageViewModel]) {
        self = original
        self.items = items
    }
}
