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
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myCapitalImage: UIImageView!
    
    lazy var firstViewModel:ViewModel1 = ViewModel1(delegate1: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        firstViewModel.getUserInfo()
    }
    
    @IBAction func inputButton(sender: UIButton){
        firstViewModel.getUserInfo()
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

extension FirstViewController:VMDelegate1{
    func passQualifications(message: String, url: String) {
        DispatchQueue.main.async {
            self.myCapitalImage.image = #imageLiteral(resourceName: "capitalOne")
            self.myImage.image = #imageLiteral(resourceName: "MrBadcredit")
            self.myImage.clipsToBounds = true
            self.myCapitalImage.clipsToBounds = true
            self.myButton.clipsToBounds = true
            self.myLabel.clipsToBounds = true
            print("FirstViewController")
        }
    }
}
