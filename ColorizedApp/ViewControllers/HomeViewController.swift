//
//  HomeViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 12.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setingsVC = segue.destination as? SettingsColorViewController else {
            return
        }
        setingsVC.homeBackgroundColor = view.backgroundColor
        
        }
    }

