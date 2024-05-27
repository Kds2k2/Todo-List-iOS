//
//  ColorViewController.swift
//  TodoList_UIKit
//
//  Created by Dmitro Kryzhanovsky on 27.05.2024.
//

import UIKit

class ColorViewController: UIViewController {
    
    var page: Pages
    
    init(with page: Pages) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = page.color
    }
}
