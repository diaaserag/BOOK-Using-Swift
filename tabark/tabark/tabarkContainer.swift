//
//  tabarkContainer.swift
//  tabark
//
//  Created by diaa on 13/08/2021.
//

import UIKit

class tabarkContainer: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    var arrcontainerView = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v1 = self.storyboard?.instantiateViewController(withIdentifier: "container")as? ViewController
        v1?.imag = UIImage(named: "1")
        arrcontainerView.append(v1!)
        
        let v2 = self.storyboard?.instantiateViewController(withIdentifier: "container")as? ViewController
        v2?.imag = UIImage(named: "2")
        arrcontainerView.append(v2!)
        
        let v3 = self.storyboard?.instantiateViewController(withIdentifier: "container")as? ViewController
        v3?.imag = UIImage(named: "3")
        arrcontainerView.append(v3!)
        
        delegate = self
        dataSource = self
        
        
        if let first = arrcontainerView.first{
            setViewControllers([first], direction:.forward, animated: true, completion: nil)
        }
    }
    


}

extension tabarkContainer{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let curent = arrcontainerView.firstIndex(of: viewController) else{
            return nil
        }
        let beforIndex = curent - 1
        guard beforIndex >= 0 else {
            return nil
        }
        return arrcontainerView[beforIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let curent = arrcontainerView.firstIndex(of: viewController) else{
            return nil
        }
        let afterIndex = curent + 1
        guard afterIndex < arrcontainerView.count else {
            return nil        }
        return arrcontainerView[afterIndex]
    }
    
}
    

