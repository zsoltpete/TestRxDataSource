//
//  PartnerMessageCell.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PartnerMessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var viewModel: MessageViewModel = MessageViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindComponents()
    }
    
    func bindComponents(){
        self.viewModel.message.asObservable().bind(to: self.messageLabel.rx.text).addDisposableTo(disposeBag)
    }
    
    func bindTo(viewModel: MessageViewModel){
        self.viewModel.message.value = viewModel.message.value
    }

}
