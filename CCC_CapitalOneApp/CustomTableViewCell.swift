//
//  CustomTableViewCell.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell:UITableViewCell{
    @IBOutlet weak var myLabel:UILabel!
    @IBOutlet weak var myImageView:UIImageView!
    
    func fillCell(with title:String, image:UIImage) {
        myLabel.text = title
        myImageView.image = image
    }
}
