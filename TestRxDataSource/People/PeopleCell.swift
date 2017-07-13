//
//  PeopleCell.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    let disposeBag = DisposeBag()
    var viewModel: PeopleViewModel = PeopleViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindComponents()
    }
    
    func bindComponents(){
        self.viewModel.userName.asObservable().bind(to: self.userNameLabel.rx.text).addDisposableTo(disposeBag)
        self.viewModel.age.asObservable().map{"\($0)"}.bind(to: self.ageLabel.rx.text).addDisposableTo(disposeBag)
    }
    
    func bindTo(viewModel: PeopleViewModel){
        self.viewModel.userName.value = viewModel.userName.value
        self.viewModel.age.value = viewModel.age.value
    }

}
