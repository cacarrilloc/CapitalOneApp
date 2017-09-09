//
//  FourthViewController.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/27/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCapitalImage: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    let taxId:Int = 888888888
    
    lazy var fourthViewModel:ViewModel4 = ViewModel4(delegate4: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = #imageLiteral(resourceName: "MrBestcredit")
        myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
    }
    
    @IBAction func inputButton(sender: UIButton){
        fourthViewModel.getUserInfo(url: "https://api-sandbox.capitalone.com/oauth2/token", taxId: taxId)
        print ("@IBAction")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FourthViewController:VMDelegate4{
    func passQualifications(array: [Product]){
        DispatchQueue.main.async {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SVC4") as! SVC4
            myVC.passArray = array
            self.navigationController?.pushViewController(myVC, animated: true)
        }
    }
}

