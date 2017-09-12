//
//  SecondViewController.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCapitalImage: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    lazy var secondViewModel:ViewModel2 = ViewModel2(delegate2: self)
    let taxId:Int = 666666666
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = #imageLiteral(resourceName: "MrsAveragecredit")
        myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
    }
    
    @IBAction func inputButton(sender: UIButton){
        secondViewModel.getUserInfo(url: "https://api-sandbox.capitalone.com/oauth2/token", taxId: taxId)
        print ("@IBAction")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SecondViewController:VMDelegate2{
    func passQualifications(array: [Product]){
        DispatchQueue.main.async {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SVC2") as! SVC2
            myVC.passArray = array
            self.navigationController?.pushViewController(myVC, animated: true)
        }
    }
}


