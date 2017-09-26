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
    let description:MarketingCopy
    
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
        guard let description = copy?.joined(separator: "\n") else {return nil}
        self.description = description
        self.additionalDescription = additional?.joined(separator: "\n")
    }
}

























