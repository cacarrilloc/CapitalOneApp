//
//  SecondViewModel.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

protocol VMDelegate2:class{
    func passQualifications(array: [Product])
}

class ViewModel2 {
    weak var secondViewController:VMDelegate2?
    
    init(delegate2:VMDelegate2? = nil){
        self.secondViewController = delegate2
    }
    let prequalificationUrl:String = "https://api-sandbox.capitalone.com/credit-offers/prequalifications"
    
    func getUserInfo(url: String, taxId:Int) {
        Networking.getToken(url: url){
            [unowned self] (error, data) in
            guard error == nil else {return}
            guard let token = data else {return}
            Networking.getPrequalification(url: self.prequalificationUrl, token: token, taxId: taxId){
                [unowned self] (error, data) in
                if let error = error {
                    print(error.localizedDescription)
                }
                guard let data = data else {return}
                do{
                    let json = try JSONSerialization.jsonObject(with: data)
                    guard let dict = json as? [String:Any] else {return}
                    guard let results = dict["products"] as? [[String:Any]] else {return}
                    let products:[Product] = results.flatMap{ try? Product(dict: $0)}
                    self.secondViewController?.passQualifications(array: products)
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

