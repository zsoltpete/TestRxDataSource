//
//  ChatViewController.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ChatViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    let messages: [MessageViewModel] =
        [
            MessageViewModel(message: "Szia", partner: true),
            MessageViewModel(message: "Szia", partner: false),
            MessageViewModel(message: "Mizu?", partner: true),
            MessageViewModel(message: "Semmi", partner: false),
            MessageViewModel(message: "Veled?", partner: false),
            MessageViewModel(message: "Nagyon jó a chat", partner: true),
            MessageViewModel(message: "Más nem sok minden", partner: true),
            ]
    
    var sections: Variable<[ChatSection]> = Variable([])
    
    var dataSource: RxTableViewSectionedReloadDataSource<ChatSection> = RxTableViewSectionedReloadDataSource<ChatSection>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDevelopers()
        self.initTableView()
        self.configureCell()
        self.bindSections()
    }
    
    func initDevelopers(){
        self.sections.value = [
            ChatSection(header: "Chat", items: messages),
        ]
    }
    
    func initTableView(){
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.rx.setDelegate(self)
            .addDisposableTo(disposeBag)
    }
    
    func configureCell(){
        dataSource.configureCell = { dataSource, tableView, indexPath, item in
            if item.partner.value {
                let cell: PartnerMessageCell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.PartnerMessageCell) as! PartnerMessageCell
                cell.bindTo(viewModel: item)
                return cell
            }else {
                let cell: UserMessageCell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.UserMessageCell) as! UserMessageCell
                cell.bindTo(viewModel: item)
                return cell
            }
        }
    }
    
    func bindSections(){
        sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
    }
    
}
