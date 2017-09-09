//
//  TVC2.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/1/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class TVC2: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    lazy var TVCViewModel2:TVCModel2 = TVCModel2(delegateTVCModel2: self)
    
    var passedName:String?
    var passedDesc:String?
    var passedImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = passedImage else {return}
        TVCViewModel2.getImage(url: image)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TVC2:VMDelegate8{
    func updateImage(image: UIImage) {
        DispatchQueue.main.async {
            self.myImage.image = image
            self.myLabel1.text = self.passedName
            self.myLabel2.text = self.passedDesc
        }
    }
}
