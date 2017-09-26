//
//  SVCModel2.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/8/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

protocol VMDelegate6:class{
    func updateTableView(image: UIImage)
}

class SVCModel2 {
    weak var SVCModelViewController2:VMDelegate6?
    var masterArray:[Product]?
    
    init(delegateSVCModel2:VMDelegate6? = nil){
        self.SVCModelViewController2 = delegateSVCModel2
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
    
    func getImage(urlIndex: Int) -> UIImage {
        var output:UIImage = #imageLiteral(resourceName: "sadFace")
        let url = getImageUrl(index: urlIndex)
        if let image = ImageCache.shared.cache.object(forKey: url as NSString){
            output = image
            self.SVCModelViewController2?.updateTableView(image: image)
        } else {
            Networking.getImage(url: url){
                [unowned self] (error, data) in
                guard error == nil else {return}
                guard let dataIn = data else {return}
                output = dataIn
                self.SVCModelViewController2?.updateTableView(image: dataIn)
            }
        }
        return output
    }
}








