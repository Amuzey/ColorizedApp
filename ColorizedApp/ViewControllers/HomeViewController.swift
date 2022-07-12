//
//  HomeViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 12.07.2022.
//

import UIKit

class HomeViewController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination.navigationController?.topViewController
      
    }
}
