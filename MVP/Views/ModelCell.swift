//
//  ModelCell.swift
//  MVP
//
//  Created by 李永杰 on 2019/3/31.
//  Copyright © 2019 李永杰. All rights reserved.
//

import UIKit
import Kingfisher

class ModelCell: UITableViewCell {
    

    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var cellModel: NewsItemModel? {
        didSet {

            timerLabel.text = cellModel?.time
            contentLabel.text = cellModel?.title
            let url = URL(string: (cellModel?.img)!)
            headerImageView.kf.setImage(with: url)
         
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

}
