//
//  Cache.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/29/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class ImageCache{
    static let shared = ImageCache()
    var cache = NSCache<NSString,UIImage>()
}
