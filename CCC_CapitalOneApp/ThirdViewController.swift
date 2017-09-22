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
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCapitalImage: UIImageView!
    
    lazy var thirdViewModel:ViewModel3 = ViewModel3(delegate3: self)
    let taxId:Int = 777777777
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
        myImage.image = #imageLiteral(resourceName: "MrsGoodcredit")
        myImage.clipsToBounds = true
        myCapitalImage.clipsToBounds = true
        myButton.clipsToBounds = true
        self.myLabel.clipsToBounds = true
        print("ThirdViewController")
    }
    
    @IBAction func inputButton(sender: UIButton){
        thirdViewModel.getUserInfo(url: "https://api-sandbox.capitalone.com/oauth2/token", taxId: taxId)
        print ("@IBAction")
    }
    
    func setBackgroundImage(){
        let background = UIImage(named: "capitalOne2")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ThirdViewController:VMDelegate3{
    func passQualifications(array: [Product]){
        DispatchQueue.main.async {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SVC3") as! SVC3
            myVC.passedArray = array
            self.navigationController?.pushViewController(myVC, animated: true)
        }
    }
}

