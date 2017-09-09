//
//  FirstViewController.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCapitalImage: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    lazy var firstViewModel:ViewModel1 = ViewModel1(delegate1: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = #imageLiteral(resourceName: "MrBadcredit")
        myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
    }
    
    @IBAction func inputButton(sender: UIButton){
        firstViewModel.getUserInfo(url: "https://api-sandbox.capitalone.com/oauth2/token")
        print ("@IBAction")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FirstViewController:VMDelegate1{
    func passQualifications(){
        DispatchQueue.main.async {
            self.myImage.image = #imageLiteral(resourceName: "MrBadcredit")
            self.myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
            print("Hello")
        }
    }
}
