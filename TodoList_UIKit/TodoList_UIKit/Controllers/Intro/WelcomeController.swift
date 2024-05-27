//
//  WelcomeController.swift
//  TodoList_UIKit
//
//  Created by Dmitro Kryzhanovsky on 27.05.2024.
//

import UIKit

class WelcomeController: UIViewController {

    private lazy var pageViewController: UIPageViewController = {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        controller.view.backgroundColor = .clear
        controller.dataSource = self
        controller.delegate = self
        return controller
    }()
    
    private var pages: [Pages] = Pages.allCases
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        let initialViewController = ColorViewController(with: pages[0])
        self.pageViewController.setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        self.pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: UIPageViewControllerDelegate
extension WelcomeController: UIPageViewControllerDelegate {
    //TODO: ...
}

//MARK: UIPageViewControllerDataSource
extension WelcomeController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewController = viewController as? ColorViewController else {
            return nil
        }
        
        var index = currentViewController.page.index
        if index == 0 {
            return ColorViewController(with: pages[pages.count - 1])
        }
        
        index -= 1
        return ColorViewController(with: pages[index])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let currentViewController = viewController as? ColorViewController else {
            return nil
        }
        
        var index = currentViewController.page.index
        if index >= pages.count - 1 {
            return ColorViewController(with: pages[0])
        }
        
        index += 1
        return ColorViewController(with: pages[index])
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return self.currentIndex
    }
}

