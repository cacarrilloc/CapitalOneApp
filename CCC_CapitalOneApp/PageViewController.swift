//
//  PageViewController.swift
//  CCC_CapitalOneApp
//
//  Created by Carlos Carrillo on 8/26/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pageControl = UIPageControl()
    
    // MARK: UIPageViewControllerDataSource (array of viewControllers)
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVC(viewController: "firstVC"),
                self.newVC(viewController: "secondVC"),
                self.newVC(viewController: "thirdVC"),
                self.newVC(viewController: "fourthVC")]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
       
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        configurePageControl()
    }
    
    // The total number of pages that are available is based on how many
    // available viewControllers we set in the orderedViewControllers array
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    // MARK: Delegate methods
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    // MARK: Data source functions. (CREATE LOOP in page controller)
    // Loop backwards
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {return nil}
        
        let previousIndex = viewControllerIndex - 1

        // User is on the first view controller and swiped left
        // to loop to the last view controller.
        guard previousIndex >= 0 else {
            // Replace 'return orderedViewControllers.first' with
            // 'return nil' to avoid the page control loops.
            return orderedViewControllers.last
        }
        guard orderedViewControllers.count > previousIndex else {return nil}
        return orderedViewControllers[previousIndex]
    }
    
    //Loop forward
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {return nil}
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right
        // to loop to the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            // Replace 'return orderedViewControllers.first' with 
            // 'return nil' to avoid the page control loops.
            return orderedViewControllers.first
        }
        guard orderedViewControllersCount > nextIndex else {return nil}
        return orderedViewControllers[nextIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
