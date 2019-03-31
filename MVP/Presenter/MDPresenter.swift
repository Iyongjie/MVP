//
//  MDPresenter.swift
//  MVP
//
//  Created by 李永杰 on 2019/3/31.
//  Copyright © 2019 李永杰. All rights reserved.
//

import Foundation
import HandyJSON

// 接口
@objc protocol MDPresenterProtocol {
    
    @objc optional func present()
    
}

class MDPresenter: NSObject {
 
    var model: NewsModel?

    var tableView: UITableView?
    
    init(tableView: UITableView) {
        super.init()
        
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = .none
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.rowHeight = 150
        self.tableView?.register(UINib(nibName: "ModelCell", bundle: Bundle.main), forCellReuseIdentifier: "cellid")
    }
}
extension MDPresenter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (model?.data?.list.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = model?.data?.list else {
            return UITableViewCell()
        }
        let cellModel = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? ModelCell
        cell?.cellModel = cellModel
        return cell!
        
    }
    
}
extension MDPresenter: MDPresenterProtocol {
    func present() {
        tableView?.reloadData()
    }
}
extension MDPresenter {
    func requestData () {
        
        let dataPath = Bundle.main.path(forResource: "data", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: dataPath!))
        let json = String(data: data!, encoding: .utf8)
        
        if let newsModel = JSONDeserializer<NewsModel>.deserializeFrom(json: json!) {
            
            model = newsModel
            present()
        }
    }
}
