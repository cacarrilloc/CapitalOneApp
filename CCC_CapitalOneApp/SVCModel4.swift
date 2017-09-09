//
//  SVCModel4.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 9/8/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

protocol VMDelegate7:class{
    func updateTableView()
}

class SVCModel4 {
    
    weak var SVCModelViewController4:VMDelegate7?
    var masterArray:[Product]?
    
    init(delegateSVCModel4:VMDelegate7? = nil){
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
    
    func getImage(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let image = array.flatMap{$0.images?[0].url}
        return image[index]
    }
    
}

