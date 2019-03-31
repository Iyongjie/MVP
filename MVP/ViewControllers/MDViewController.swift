//
//  ViewController.swift
//  MVP
//
//  Created by 李永杰 on 2019/3/31.
//  Copyright © 2019 李永杰. All rights reserved.
//

import UIKit

class MDViewController: UIViewController {
    var tableView: UITableView = UITableView()
    
    lazy var mdPresenter: MDPresenter = {
        let presenter = MDPresenter(tableView: tableView)
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        mdPresenter.requestData()

    }
    func configUI () {
        title = "MVP Demo";
        tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.addSubview(tableView)
    }

}

