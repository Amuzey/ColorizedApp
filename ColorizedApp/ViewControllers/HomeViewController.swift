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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setingsVC = segue.destination as? SettingsColorViewController else {
            return
        }
        setingsVC.homeBackgroundColor = view.backgroundColor
        setingsVC.delegate = self
    }
    
}
//MARK: - RGBA Unpacking
extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}

//MARK: - SettingsColorViewControllerDelegate
extension HomeViewController: SettingsColorViewControllerDelegate {
    func setNewBackground(color: UIColor) {
        view.backgroundColor = color
    }
}
