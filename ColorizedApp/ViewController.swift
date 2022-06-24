//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paletteColorView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        paletteColorView.layer.cornerRadius = 15
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
    }

    @IBAction func redSliderAction() {
        redLabel.text = String(round(redSlider.value * 100) / 100)
        paletteColorView.backgroundColor = .init(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = String(round(greenSlider.value * 100) / 100)
        paletteColorView.backgroundColor = .init(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(round(blueSlider.value * 100) / 100)
        paletteColorView.backgroundColor = .init(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
}
