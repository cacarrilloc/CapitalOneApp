//
//  Networking.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/26/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

class Networking {
    // Get Tokens
    static func getToken(url: String, completion:@escaping(Error?, String?)->()){
        let headers = ["Content-Type": "application/x-www-form-urlencoded"]
        let params = [
            "client_id": "enterpriseapi-sb-tJOw55ype3LktRNB5zY7oIHq",
            "client_secret": "175384eb1888f2dded491e8d7242398f0c5901db",
            "grant_type": "client_credentials"
        ]
        Alamofire.request(url, method: .post, parameters: params, headers: headers).responseJSON { (response) in
            let responseJSON = response.result.value as! [String:AnyObject]
            let accessToken = responseJSON["access_token"] as! String
            completion(response.error, accessToken)
        }
    }
    
    // Get Qualifications
    static func getPrequalification(url:String, token:String, taxId:Int, completion:@escaping(Error?, Data?)->()){
        
        let headers = [
            "Accept": "application/json; v=3",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)",
            "Accept-Language": "en-US"
        ]
        let params = [
            "firstName": "Rose",
            "lastName": "Dean",
            "address": [
                "addressLine1": "88 Suffolk St",
                "city": "Springfield",
                "stateCode": "MA",
                "postalCode": "01109",
                "countryCode": "US"
            ],
            "taxId": "\(taxId)",
            "dateOfBirth": "1964-11-12"
        ] as [String:Any]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            guard response.error == nil else {return}
            guard response.data != nil else {return}
            completion(response.error, response.data)
        }
    }
    
    // Get Card Image
    static func getImage(url:String, forObject:UIImageView? = nil, completion:@escaping(Error?, UIImage?)->()){
        Alamofire.request(url, method: .get).responseData { response in
            guard let image = response.data else {return}
            DispatchQueue.main.async {
                guard let image = UIImage(data: image) else {return}
                ImageCache.shared.cache.setObject(image, forKey: url as NSString)
                completion(nil, image)
                print("Picture downloaded.")
            }
        }
    }
    deinit {
        print("got removed from the app")
    }
}









