//
//  SVCModel1.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/20/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate5:class{
    func passQualifications(message:String)
}

class SVCModel1 {
    
    weak var SVCModelViewController1:VMDelegate5?
    var masterArray:[Product]?
    
    init(delegateSVCModel1:VMDelegate5? = nil){
        self.SVCModelViewController1 = delegateSVCModel1
    }
    
    func getUserInfo() {
        let string = "SORRY. YOU DO NOT QUALIFY TO ANY OF OUR CREDIT CARDS."
        SVCModelViewController1?.passQualifications(message: string)
    }
    
}

