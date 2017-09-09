//
//  FourthViewModel.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate4:class{
    func passQualifications(array: [Product])
}

class ViewModel4 {
    
    var cardProducts:[Product]?
    
    var token:String?
    var passingArray:[[String]] = []
    let prequalificationUrl:String = "https://api-sandbox.capitalone.com/credit-offers/prequalifications"
    
    weak var fourthViewController:VMDelegate4?
    
    init(delegate4:VMDelegate4? = nil){
        self.fourthViewController = delegate4
    }
    
    func getUserInfo(url: String, taxId:Int) {
        Networking.getToken(url: url){
            [unowned self] (error, data) in
            guard error == nil else {return}
            guard data != nil else {return}
            self.token = data
            Networking.getPrequalification(url: self.prequalificationUrl, token: self.token!, taxId: taxId){
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
                    self.fourthViewController?.passQualifications(array: products)
        
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
