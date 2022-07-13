//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Алексей on 24.06.2022.
//

import UIKit

class SettingsColorViewController: UIViewController {
    
    // MARK: - IB Oulets
    @IBOutlet weak var paletteView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var homeBackgroundColor: UIColor!
    var delegate: SettingsColorViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToolBar()
        setupUI()
        setupValue(sliders: redSlider, greenSlider, blueSlider)
        setupLabel(for: redLabel, greenLabel, blueLabel)
        setupTextField(for: redTextField, greenTextField, blueTextField)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        setupLabel(for: redLabel, greenLabel, blueLabel)
        setupTextField(for: redTextField, greenTextField, blueTextField)
        setupColorView()
    }
    
    @IBAction func doneButtonPresed() {
        view.endEditing(true)
        delegate.setNewBackground(color: paletteView.backgroundColor ?? .blue)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupColorView() {
        paletteView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setupLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setupTextField(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setupUI() {
        paletteView.backgroundColor = homeBackgroundColor
        paletteView.layer.cornerRadius = 15
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setupValue(sliders: UISlider...) {
        sliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(homeBackgroundColor.rgba.red)
            case greenSlider:
                greenSlider.value = Float(homeBackgroundColor.rgba.green)
            default:
                blueSlider.value = Float(homeBackgroundColor.rgba.blue)
            }
        }
    }
    @objc private func doneBarButtonPresed () {
        view.endEditing(true)
    }
    
    
    private func setupToolBar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBarBottun = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBarButtonPresed))
        toolBar.setItems([doneBarBottun], animated: true)
    
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
    }
}

//MARK: - SettingsColorViewController
extension SettingsColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let floatValue = Float(newValue) else { return }
        if textField == redTextField {
            redSlider.value = floatValue
        } else if textField == greenTextField {
            greenSlider.value = floatValue
        } else if textField == blueTextField {
            blueSlider.value = floatValue
        }
        setupColorView()
    }
}
