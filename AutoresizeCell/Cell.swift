//
//  Cell.swift
//  AutoresizeCell
//
//  Created by Ricardo Yamaguchi on 17/03/19.
//  Copyright © 2019 Ricardo Yamaguchi. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet private weak var contentLabel: UILabel?
    var content: String? {
        didSet {
            contentLabel?.text = content
            layoutIfNeeded()
        }
    }
    
}
