//
//  CollapsibleTableViewController.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 5/30/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit

//
// MARK: - View Controller
//
class CollapsibleTableViewController: UIViewController {
    
    var sectionsViewMOdel = ViewModel()
    var tableView: UITableView  =   UITableView()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsViewMOdel.reloadSections = { [weak self] (section: Int) in
            self?.tableView.beginUpdates()
            self?.tableView.reloadSections([section], with: .fade)
            self?.tableView.endUpdates()
               }
        
        
               // Get main screen bounds
        let screenSize: CGRect = UIScreen.main.bounds
               
               let screenWidth = screenSize.width
               let screenHeight = screenSize.height
        tableView.estimatedRowHeight = 94.0
        tableView.rowHeight = UITableView.automaticDimension
               tableView.sectionHeaderHeight = 100
        tableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight);
               tableView.dataSource = sectionsViewMOdel
               tableView.delegate = sectionsViewMOdel
               
               tableView.register(CollapsibleTableViewCell.self, forCellReuseIdentifier: "cell")

               tableView.register(CollapsibleTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
               self.view.addSubview(tableView)

        
        
     
        self.title = "Apple Products Ram"
    }
    
}

