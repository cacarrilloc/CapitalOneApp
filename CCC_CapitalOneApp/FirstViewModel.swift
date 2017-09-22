//
//  FirstViewModel.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate1:class{
    func passQualifications(message:String)
}

class ViewModel1 {
    
    var token:String?
    let taxId:Int = 555555555
    let prequalificationUrl:String = "https://api-sandbox.capitalone.com/credit-offers/prequalifications"
    
    weak var firstViewController:VMDelegate1?
    
    init(delegate1:VMDelegate1? = nil){
        self.firstViewController = delegate1
    }
    
    func getUserInfo() {
        let string = "SORRY. YOU DO NOT QUALIFY TO ANY OF OUR CREDIT CARDS."
        firstViewController?.passQualifications(message: string)
    }
    
}
