//
//  ThirdViewController.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCapitalImage: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    lazy var thirdViewModel:ViewModel3 = ViewModel3(delegate3: self)
    let taxId:Int = 777777777
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = #imageLiteral(resourceName: "MrsGoodcredit")
        myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
    }
    
    @IBAction func inputButton(sender: UIButton){
        thirdViewModel.getUserInfo(url: "https://api-sandbox.capitalone.com/oauth2/token", taxId: taxId)
        print ("@IBAction")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ThirdViewController:VMDelegate3{
    func passQualifications(array: [Product]){
        DispatchQueue.main.async {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SVC3") as! SVC3
            myVC.passArray = array
            self.navigationController?.pushViewController(myVC, animated: true)
        }
    }
}

