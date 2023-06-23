//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    
    var model = WeatherManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
    }

    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // dismiss keyboard
        print(searchTextField.text!)
        
    }
    
    
    
    // process the return button on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // dismiss keyboard
        print(searchTextField.text!)
        return true
    }
    
    
    
    // clear texfield when user are done editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use the search textfield to get the weather for that city
        
        if  let city = searchTextField.text {
            model.fetechWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    
    // validate user input
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" { // dont care which textifeld was tigger apply valdation to any text field; i.e (searchTextField.text!) for specfic
            return true
        } else {
            textField.placeholder = "Type something"
           return  false
        }
    }
    
    
    
    
}

