//
//  FirstViewModel.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

protocol VMDelegate1:class{
    func passQualifications(message:String, url:String)
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
        let msg = "SORRY. YOU DO NOT QUALIFY TO ANY OF OUR CREDIT CARDS."
        firstViewController?.passQualifications(message: msg, url: prequalificationUrl)
    }
}
