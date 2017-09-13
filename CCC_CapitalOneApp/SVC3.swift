//
//  SCV3.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/29/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SVC3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    lazy var SVCViewModel3:SVCModel3 = SVCModel3(delegateSVCModel3: self)
    
    var passArray:[Product]?
    var nameToPass:String?
    var descToPass:String?
    var imageToPass:String?
    var currentImage:UIImage?
    
    //let images = [#imageLiteral(resourceName: "card1"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let array = passArray else {return}
        SVCViewModel3.getMasterArray(array: array)
        let bundle = Bundle(for: CustomTableViewCell.self)
        let nib = UINib(nibName: "CustomeViewCell", bundle: bundle)
        self.myTableView.register(nib, forCellReuseIdentifier: "CustomCell")
    }
    
    // Load the table every single time you get to this tab
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    // Populate table with output array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SVCViewModel3.getCounter()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        SVCViewModel3.getImage(urlIndex: indexPath.row) // Download Image from API Call
        let name = SVCViewModel3.getName(index: indexPath.row)
        guard let imageIn = currentImage else {return cell} // Receive Image
        cell.fillCell(with: name, image: imageIn)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get Values to be passed
        nameToPass = SVCViewModel3.getName(index: indexPath.row)
        imageToPass = SVCViewModel3.getImageUrl(index: indexPath.row)
        descToPass = SVCViewModel3.getDescription(index: indexPath.row)
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mySegue") {
            // Initialize new view controller with desired target
            let viewController = segue.destination as! TVC3
            viewController.passedName = nameToPass   // Pass Values to target
            viewController.passedDesc = descToPass   // Pass Values to target
            viewController.passedImage = imageToPass // Pass Values to target
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SVC3:VMDelegate6{
    func updateTableView(image: UIImage) {
        DispatchQueue.main.async {
            self.currentImage = image
            self.myTableView.reloadData()
        }
    }
}

