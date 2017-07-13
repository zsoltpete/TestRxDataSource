//
//  PeopleHeaderCell.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PeopleHeaderCell: UITableViewCell {

    @IBOutlet weak var teamLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var viewModel: PeopleHeaderViewModel = PeopleHeaderViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindComponents()
    }
    
    func bindComponents(){
        self.viewModel.team.asObservable().bind(to: self.teamLabel.rx.text).addDisposableTo(disposeBag)
    }
    
    func bindTo(team: String){
        self.viewModel.team.value = team
    }

}
