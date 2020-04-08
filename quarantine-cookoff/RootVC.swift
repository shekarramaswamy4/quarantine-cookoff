//
//  RootVC.swift
//  
//
//  Created by shekar ramaswamy on 4/8/20.
//

import Foundation
import UIKit

class RootVC: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
}
