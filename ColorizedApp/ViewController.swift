//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Oulets
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
        setupColorView()
    }
    
    // MARK: - IB Actions
    @IBAction func redSliderAction() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        setupColorView()
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        setupColorView()
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        setupColorView()
    }
    
    // MARK: - Private Methods
    private func setupColorView() {
        paletteColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
