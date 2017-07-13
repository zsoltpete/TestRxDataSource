//
//  HomeViewController.swift
//  TestRxDataSource
//
//  Created by Zsolt Pete on 2017. 07. 13..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle()
    }
    
    func setTitle(){
        self.title = "Test RxDataSources"
    }
    
    @IBAction func showMultiplySections(_ sender: Any) {
        self.performSegue(withIdentifier: Constants.Segues.ShowPeopleSegue, sender: nil)

    }
    @IBAction func showDifferentCells(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowDifferentCellsSegue", sender: nil)
    }

}
