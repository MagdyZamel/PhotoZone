//
//  PageViewController.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 8/24/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import UIKit
import SnapKit
protocol PageTabsVCDelegate:class {
    func pageTabsVC(didFinishAnimating indexOfCurrentVC:Int)
}
class PageTabsVC: UIPageViewController {

    var orderedViewControllers: [UIViewController]!
    weak var pageTabsDeleagte:PageTabsVCDelegate?
    var currentVC:UIViewController!
    var indexOfcurrentVC:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self

        if let firstViewController = orderedViewControllers.first {
            self.indexOfcurrentVC = 0
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }


    }

    func goToViewControllerOfIndex(_ index:Int){

        let direction:UIPageViewControllerNavigationDirection = index  > indexOfcurrentVC ? .forward:.reverse
        self.indexOfcurrentVC = index
        print("index \(indexOfcurrentVC)")
        setViewControllers([orderedViewControllers[index]],direction: direction ,  animated: true,
                           completion: nil)
    }
}

extension PageTabsVC: UIPageViewControllerDataSource,UIPageViewControllerDelegate{

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        let pageContentViewController = pageViewController.viewControllers![0]
        indexOfcurrentVC = orderedViewControllers.index(of: pageContentViewController)!
        print("indexOfcurrentVC \(indexOfcurrentVC)")
        pageTabsDeleagte?.pageTabsVC(didFinishAnimating: indexOfcurrentVC )


    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
             return nil
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]

    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController ) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
             return nil
        }

        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }

}

