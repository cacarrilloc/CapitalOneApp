//
//  CapitalClass.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/28/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


enum ProductError:Error {
    case NoProductName
    case NoImageDictionary
    case NoMktCopy
}

extension ProductError:LocalizedError {
    public var errorDescription:String?{
        switch self {
        case .NoProductName:
            return NSLocalizedString("No Product Name", comment: "Json did not have a name")
        case .NoImageDictionary:
            return NSLocalizedString("No Product Image", comment: "Json did not have an image")
        case .NoMktCopy:
            return NSLocalizedString("No Product MarketingCopy", comment: "Json did not have a MarketingCopy")
        }
    }
}


class Product {
    
    let displayName:String
    var images:[ProductImage]?
    var description:MarketingCopy
    
    init(dict:[String:Any])throws {
        guard let dispName = dict["productDisplayName"] as? String else {
            throw ProductError.NoProductName
        }
        self.displayName = dispName
        
        guard let imagesDict = dict["images"] as? [[String:Any]] else {
            throw ProductError.NoImageDictionary
        }
        for pImage in imagesDict {
            guard let height = pImage["height"] as? Int else {continue}
            guard let width = pImage["width"] as? Int else {continue}
            guard let url = pImage["url"] as? String else {continue}
            
            let proImage = ProductImage(height: height, width: width, url: url)
            
            if images != nil {
                images?.append(proImage)
            } else {
                images = []
                images?.append(proImage)
            }
        }
        guard let copy = MarketingCopy(copy: dict["marketingCopy"] as? [String], additional: dict["additionalMarketingCopy"] as? [String]) else {
            throw ProductError.NoMktCopy
        }
        self.description = copy
    }
}


class ProductImage {
    let height:Int
    let width:Int
    let url:String
    
    init(height:Int, width:Int, url:String) {
        self.height = height
        self.width = width
        self.url = url
    }
}


class MarketingCopy {
    
    let description:String
    let additionalDescription:String?
    
    init?(copy:[String]?, additional:[String]?) {
        guard let description = copy?.joined(separator: "\n") else {
            return nil
        }
        self.description = description
        self.additionalDescription = additional?.joined(separator: "\n")
    }
}






















/*
class Product2 {
    
    let displayName:[String]
    var description:[String]
    var additionaDesc:[String]
    var imageUrl:[String] = []
    
    init(dict:[[String:Any]])throws {
        
        // Card Types
        let cardNames:[String] = dict.flatMap{return $0["productDisplayName"] as? String}
        self.displayName = cardNames
        
        // Card Related Info
        let copy:[String] = dict.flatMap{return ($0["marketingCopy"] as? [String])!.joined(separator: "\n")}
        self.description = copy
        
        let additionalCopy:[String] = dict.flatMap{return ($0["additionalMarketingCopy"] as? [String])!.joined(separator: "\n")}
        self.additionaDesc = additionalCopy
        
        // Card Images
        for index in dict {
            let current1 = index["images"] as? [[String:Any]]
            for index2 in current1! {
                let current2 = (index2["url"] as? String)!
                imageUrl.append(current2)
            }
        }
    }
}
 
*/


