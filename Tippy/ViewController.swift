//
//  ViewController.swift
//  Tippy
//
//  Created by Joey Steigelman on 2/26/21.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet var cardsCollection: [UIView]!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var partySizeControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCardsCollection()
        //Check for taps
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func configureCardsCollection() {
        for card in cardsCollection {
            //add rounded corners to cards
            card.layer.cornerRadius = 20
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        //calculate per person amount
        let partySize = [1, 2, 3, 4, 5, 6, 7, 8]
        let selectedPartySize = partySize[partySizeControl.selectedSegmentIndex]
        let perPerson = total / (Double(selectedPartySize))
        
        //update per person amount
        perPersonLabel.text = String(format: "$%.2f", perPerson)
        
    }
    
    
    @IBAction func calculatePerPerson(_ sender: Any) {
        //call calculateTip to update per person amount
        calculateTip(UIButton())
    }
    
    //calculate tip when Bill Amount is edited
    @IBAction func textFieldChanged(_ sender: UITextField) {
        calculateTip(UIButton())
    }
    
    //Dismiss Numpad when tap outside of numpad
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
}

