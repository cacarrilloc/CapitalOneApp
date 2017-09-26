//
//  SCV1.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/28/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

class SCV1: UIViewController  {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    lazy var SVCViewModel1:SVCModel1 = SVCModel1(delegateSVCModel1: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        SVCViewModel1.getUserInfo()
    }
    
    func setBackgroundImage(){
        let background = UIImage(named: "capitalOne2")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SCV1:VMDelegate5{
    func passQualifications(message: String) {
        DispatchQueue.main.async {
            self.myLabel.text = message
            self.myImage.image = #imageLiteral(resourceName: "sadFace")
            self.myLabel.clipsToBounds = true
        }
    }
}



