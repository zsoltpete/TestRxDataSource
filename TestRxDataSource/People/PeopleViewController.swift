//
//  PeopleViewController.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class PeopleViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    let developers: [[PeopleViewModel]] = [
        [
            PeopleViewModel(userName: "Petez", age: 21),
            PeopleViewModel(userName: "EGabor", age: 22),
            PeopleViewModel(userName: "iUjlaki", age: 27)
        ],
        [
            PeopleViewModel(userName: "Boros", age: 23),
            PeopleViewModel(userName: "Gizmo", age: 30),
            PeopleViewModel(userName: "Lali", age: 27)
        ],
        [
            PeopleViewModel(userName: "Papó", age: 27)
        ]
    ]
    var sections: Variable<[PeopleSection]> = Variable([])
    
    var dataSource: RxTableViewSectionedReloadDataSource<PeopleSection> = RxTableViewSectionedReloadDataSource<PeopleSection>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDevelopers()
        self.initTableView()
        self.configureCell()
        self.configureHeader()
        self.bindSections()
    }
    
    func initDevelopers(){
        self.sections.value = [
            PeopleSection(header: "iOS Team", items: developers[0]),
            PeopleSection(header: "Android Team", items: developers[1]),
            PeopleSection(header: "Web Team", items: developers[2])
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
            let cell: PeopleCell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.PeopleCell) as! PeopleCell
            cell.bindTo(viewModel: item)
            return cell
        }
    }
    
    func configureHeader(){
        dataSource.titleForHeaderInSection = { ds, index in
            return "d"
        }
    }
    
    func bindSections(){
        sections.asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func addDeveloper(_ sender: Any) {
        self.addDeveloper()
        guard let addButton: UIButton = sender as? UIButton else {
            return
        }
        addButton.isEnabled = false
    }
    
    func addDeveloper(){
        self.sections.value[2].items.append(PeopleViewModel(userName: "Saca", age: 21))
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell: PeopleHeaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.PeopleHeaderCell) as? PeopleHeaderCell else {
            return UIView()
        }
        cell.bindTo(team: self.sections.value[section].header)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

    }
    

    
}
