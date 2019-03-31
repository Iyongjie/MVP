//
//  NewsModel.swift
//  MVP
//
//  Created by 李永杰 on 2019/3/31.
//  Copyright © 2019 李永杰. All rights reserved.
//

import Foundation
import HandyJSON

class NewsModel: HandyJSON {
    
    var result: String = ""
    var msg: String = ""
    var data: DataModel?
    
    required init () {}
    
}
class DataModel: HandyJSON {
    
    var page: Int = 0
    var total_num: Int = 0
    var lastId: String = ""
    var list = [NewsItemModel]()
    
    required init () {}
    
}
    
class NewsItemModel: HandyJSON {
    
    var title: String = ""
    var time: String = ""
    var img: String = ""
    var orginImg: String = ""
    
    required init() {}
    
}
