//
//  SCV4.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/29/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class TVC4: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    lazy var TVCViewModel4:TVCModel4 = TVCModel4(delegateTVCModel4: self)
    
    var passedName:String?
    var passedDesc:String?
    var passedImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = passedImage else {return}
        TVCViewModel4.getImage(url: image)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TVC4:VMDelegate10{
    func updateImage(image: UIImage) {
        DispatchQueue.main.async {
            self.myImage.image = image
            self.myLabel1.text = self.passedName
            self.myLabel2.text = self.passedDesc
        }
    }
}
