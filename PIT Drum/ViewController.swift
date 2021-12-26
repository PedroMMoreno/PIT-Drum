//
//  ViewController.swift
//  PIT Drum
//
//  Created by Pedro Moreno on 03/10/2021.
//  Copyright © 2020 Pedro M. Moreno. All rights reserved.
//

import UIKit

///
/// ViewController handles the user interaction with the main view.
///
/// - Author: Pedro M. Moreno
/// - Date: 03/10/2021.
///
class ViewController: UIViewController {
    
    /* VARIABLES */
    
    /* CONTROL FLOW */
    var isOpen: Bool = false
    
    /* INSTRUMENT */
    var audioSampler: AudioSampler!
    //Test coment
    /* BUTTONS */
    @IBOutlet var kickButton: UIButton!
    @IBOutlet var snareButton: UIButton!
    @IBOutlet var hatButton: UIButton!
    @IBOutlet var crash1Button: UIButton!
    @IBOutlet var tom1Button: UIButton!
    @IBOutlet var cymbalButton: UIButton!
    @IBOutlet var tom2Button: UIButton!
    @IBOutlet var crash2Button: UIButton!
    @IBOutlet var crash3Button: UIButton!
    
    /* func viewDidLoad */
    /// Sets up the Main view and its initial elements.
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        audioSampler = AudioSampler() // Create instance of AudioSampler class
        setUpButtons()
    }
    
    /* func setUpButtons */
    /// Initializes Main window's buttons.
    ///
    func setUpButtons(){
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        let config2 = UIImage.SymbolConfiguration(pointSize: 30)
        
        let image = UIImage(systemName: "circle.fill", withConfiguration: config)!
        image.withTintColor(.orange)
        let image2 = UIImage(systemName: "square.fill", withConfiguration: config2)!
        image.withTintColor(.orange)
        kickButton.setImage(image2, for: .highlighted)
        snareButton.layer.cornerRadius = 0.5 * snareButton.bounds.size.width
        snareButton.setImage(image, for: .highlighted)
        hatButton.layer.cornerRadius = 0.5 * hatButton.bounds.size.width
        hatButton.setImage(image, for: .highlighted)
        crash1Button.layer.cornerRadius = 0.5 * crash1Button.bounds.size.width
        crash1Button.setImage(image, for: .highlighted)
        tom1Button.layer.cornerRadius = 0.5 * tom1Button.bounds.size.width
        tom1Button.setImage(image, for: .highlighted)
        cymbalButton.layer.cornerRadius = 0.5 * cymbalButton.bounds.size.width
        cymbalButton.setImage(image, for: .highlighted)
        tom2Button.layer.cornerRadius = 0.5 * tom2Button.bounds.size.width
        tom2Button.setImage(image, for: .highlighted)
        crash2Button.layer.cornerRadius = 0.5 * crash2Button.bounds.size.width
        crash2Button.setImage(image, for: .highlighted)
        crash3Button.layer.cornerRadius = 0.5 * crash3Button.bounds.size.width
        crash3Button.setImage(image, for: .highlighted)
    }
    
    /* func playSample */
    /// Handles sampler playback.
    ///
    @IBAction func playSample(_ sender: UIButton) {
        var tag = sender.tag
        
        if sender.tag == 3 && isOpen {
            tag = 10
        }
        
        audioSampler.playSample(tag: tag )
    }
    
    /* func changeHat */
    /// Manages hi-hat open/closed state.
    ///
    @IBAction func changeHat(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            isOpen = false
        } else {
            isOpen = true
        }
    }
    
    
}


