//
//  TVCModel2.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/8/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate8:class{
    func updateImage(image: UIImage)
}

class TVCModel2 {
    
    weak var TVCModelViewController2:VMDelegate8?
    var masterArray:[Product]?
    
    init(delegateTVCModel2:VMDelegate8? = nil){
        self.TVCModelViewController2 = delegateTVCModel2
    }
    
    func getImage(url:String) {
        Networking.getImage(url: url){
            [unowned self] (error, data) in
            guard error == nil else {return}
            guard let dataIn = data else {return}
            self.TVCModelViewController2?.updateImage(image: dataIn)
        }
    }
    
}




