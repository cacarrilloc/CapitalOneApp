//
//  SCV1.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/28/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class SCV1: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = #imageLiteral(resourceName: "sadFace")
        myLabel.text = "SORRY! YOU HAVE NOT BEEN PREQUALIFIED..."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
