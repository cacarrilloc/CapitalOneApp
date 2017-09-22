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
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCapitalImage: UIImageView!
    
    lazy var secondViewModel:ViewModel2 = ViewModel2(delegate2: self)
    let taxId:Int = 666666666
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        self.myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
        self.myImage.image = #imageLiteral(resourceName: "MrsAveragecredit")
        self.myImage.clipsToBounds = true
        self.myCapitalImage.clipsToBounds = true
        self.myButton.clipsToBounds = true
        self.myLabel.clipsToBounds = true
        print("SecondViewController")
    }
    
    @IBAction func inputButton(sender: UIButton){
        secondViewModel.getUserInfo(url: "https://api-sandbox.capitalone.com/oauth2/token", taxId: taxId)
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

extension SecondViewController:VMDelegate2{
    func passQualifications(array: [Product]){
        DispatchQueue.main.async {
            let myVC = self.storyboard?.instantiateViewController(withIdentifier: "SVC2") as! SVC2
            myVC.passedArray = array
            self.navigationController?.pushViewController(myVC, animated: true)
        }
    }
}


