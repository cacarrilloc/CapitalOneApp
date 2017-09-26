//
//  SCV4.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/29/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
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

extension TVC4:VMDelegate11{
    func updateImage(image: UIImage) {
        DispatchQueue.main.async {
            // Display data
            self.myImage.image = image
            self.myLabel1.clipsToBounds = true
            self.myLabel2.clipsToBounds = true
            self.myLabel1.text = self.passedName
            self.myLabel2.text = self.passedDesc
            
            // Backgroud Image
            let background = UIImage(named: "capitalOne2")
            var imageView : UIImageView!
            imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode =  UIViewContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = self.view.center
            self.view.addSubview(imageView)
            self.view.sendSubview(toBack: imageView)
        }
    }
}
