//
//  PeopleSection.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct PeopleSection {
    var header: String
    var items: [PeopleViewModel]
}

extension PeopleSection : SectionModelType {
    typealias Item = PeopleViewModel
    
    var identity: String {
        return header
    }
    
    init(original: PeopleSection, items: [PeopleViewModel]) {
        self = original
        self.items = items
    }
}
