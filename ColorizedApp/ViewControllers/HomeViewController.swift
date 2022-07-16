//
//  HomeViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 12.07.2022.
//

import UIKit

protocol SettingsColorViewControllerDelegate {
    func setNewBackground(color: UIColor)
}

class HomeViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setingsVC = segue.destination as? SettingsColorViewController else {
            return
        }
        setingsVC.delegate = self
        setingsVC.homeBackgroundColor = view.backgroundColor
    }
    
}


//MARK: - SettingsColorViewControllerDelegate
extension HomeViewController: SettingsColorViewControllerDelegate {
    func setNewBackground(color: UIColor) {
        view.backgroundColor = color
    }
}
