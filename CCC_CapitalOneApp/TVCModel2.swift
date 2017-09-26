//
//  TVCModel2.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/8/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

protocol VMDelegate9:class{
    func updateImage(image: UIImage)
}

class TVCModel2 {
    
    weak var TVCModelViewController2:VMDelegate9?
    
    init(delegateTVCModel2:VMDelegate9? = nil){
        self.TVCModelViewController2 = delegateTVCModel2
    }
    
    func getImage(url:String) {
        if let image = ImageCache.shared.cache.object(forKey: url as NSString){
            self.TVCModelViewController2?.updateImage(image: image)
        } else {
            Networking.getImage(url: url){
                [unowned self] (error, data) in
                guard error == nil else {return}
                guard let dataIn = data else {return}
                self.TVCModelViewController2?.updateImage(image: dataIn)
            }
        }
    }
}




