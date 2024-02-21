//
//  ViewController.swift
//  threePickerApp
//
//  Created by Jonah Whitney on 2/21/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    var componentOne: [String] = [String]()
    var componentTwo: [String] = [String]()
    var componentThree: [String] = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return componentOne.count
        case 1: return componentTwo.count
        default: return componentThree.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return componentOne[row]
        case 1: return componentTwo[row]
        default: return componentThree[row]
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        componentOne = ["Red", "White", "Sparkling", "Other"]
        componentTwo = ["Cabernet", "Merlot", "Pinot Noir", "Blend", "Chardonnay", "Pinot Grigio", "Sauv Blanc", "Prosecco", "Champagne", "Brute"]
        componentThree = ["Yum", "Yuck", "Yes", "No", "Maybe"]
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let colorIndex = myPicker.selectedRow(inComponent: 0)
        let styleIndex = myPicker.selectedRow(inComponent: 1)
        let ratingIndex = myPicker.selectedRow(inComponent: 2)
        
        let alert = UIAlertController(title: "Wine Choice", message: "\(componentOne[colorIndex]) \(componentTwo[styleIndex]) \(componentThree[ratingIndex])", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
        })
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

