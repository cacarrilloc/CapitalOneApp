//
//  TVCMode4.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/8/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate10:class{
    func updateImage(image: UIImage)
}

class TVCModel4 {
    
    weak var TVCModelViewController4:VMDelegate10?
    
    init(delegateTVCModel4:VMDelegate10? = nil){
        self.TVCModelViewController4 = delegateTVCModel4
    }
    
    func getImage(url:String) {
        if let image = ImageCache.shared.cache.object(forKey: url as NSString){
            self.TVCModelViewController4?.updateImage(image: image)
        } else {
            Networking.getImage(url: url){
                [unowned self] (error, data) in
                guard error == nil else {return}
                guard let dataIn = data else {return}
                self.TVCModelViewController4?.updateImage(image: dataIn)
            }
        }
    }
}
