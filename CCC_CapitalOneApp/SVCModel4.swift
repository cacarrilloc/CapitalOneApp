//
//  SVCModel4.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/8/18.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate8:class{
    func updateTableView(image: UIImage)
}

class SVCModel4 {
    
    weak var SVCModelViewController4:VMDelegate8?
    var masterArray:[Product]?
    
    init(delegateSVCModel4:VMDelegate8? = nil){
        self.SVCModelViewController4 = delegateSVCModel4
    }
    
    func getMasterArray(array: [Product]) {
        masterArray = array.flatMap{$0}
    }
    
    func getCounter() -> Int {
        guard let counter = masterArray?.count else {return 0}
        return counter
    }
    
    func getName(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let name = array.flatMap{$0.displayName}
        return name[index]
    }
    
    func getDescription(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let desc = array.flatMap{$0.description.description}
        return desc[index]
    }
    
    func getImageUrl(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let image = array.flatMap{$0.images?[0].url}
        return image[index]
    }
    
    func getImage(url: String) -> UIImage {
        var output:UIImage = #imageLiteral(resourceName: "sadFace")
        if let image = ImageCache.shared.cache.object(forKey: url as NSString){
            output = image
            self.SVCModelViewController4?.updateTableView(image: image)
        } else {
            Networking.getImage(url: url){
                [unowned self] (error, data) in
                guard error == nil else {return}
                guard let dataIn = data else {return}
                output = dataIn
                self.SVCModelViewController4?.updateTableView(image: dataIn)
            }
        }
        return output
    }
}

