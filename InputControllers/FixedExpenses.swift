//
//  FixedExpenses.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/14/21.
//

import Foundation
import UIKit

class FixedExpenses: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var icon1: UIImageView!
    @IBOutlet weak var icon2: UIImageView!
    @IBOutlet weak var icon3: UIImageView!
    @IBOutlet weak var icon4: UIImageView!
    @IBOutlet weak var icon5: UIImageView!
    @IBOutlet weak var icon6: UIImageView!
    @IBOutlet weak var icon7: UIImageView!
    @IBOutlet weak var icon8: UIImageView!
    @IBOutlet weak var icon9: UIImageView!
    
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var utilitiesLabel: UILabel!
    @IBOutlet weak var billsLabel: UILabel!
    @IBOutlet weak var tuitionLabel: UILabel!
    @IBOutlet weak var insuranceLabel: UILabel!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var membershipLabel: UILabel!
    @IBOutlet weak var charityLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!

    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var utilitiesTextField: UITextField!
    @IBOutlet weak var billsTextField: UITextField!
    @IBOutlet weak var tuitionTextField: UITextField!
    @IBOutlet weak var insuranceTextField: UITextField!
    @IBOutlet weak var carTextField: UITextField!
    @IBOutlet weak var membershipTextField: UITextField!
    @IBOutlet weak var charityTextField: UITextField!
    @IBOutlet weak var otherTextField: UITextField!
    
    
    let defaults = UserDefaults.standard
    var house = 0
    var utilities = 0
    var bills = 0
    var tuition = 0
    var insurance = 0
    var car = 0
    var memberships = 0
    var charity = 0
    var other = 0
    var budgetNumber = 0
    
    
    /*
     0 Rent/mortgage = Per Month
     1 Utilities  = Per Month
     2 Bills (Phone, internet, television) = Per Month
     3 Tuition = Per Semester
     4 Insurance = Per Month / (Per Year)?
     5 Car Payment = Per Month
     6 Memberships = Per Month
     7 Charity = Per Month
     8 Other (+ Other repeating expenses like a parking pass) = Per Month

     */
    
    @IBAction func back(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewCon = storyboard.instantiateViewController(withIdentifier: "IncomeInput") as! IncomeInput
        viewCon.modalTransitionStyle = .crossDissolve
        viewCon.modalPresentationStyle = .fullScreen
        self.present(viewCon, animated: true, completion: nil)
        
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        
        if (budgetNumber == 1) {
            defaults.set(house, forKey: "budget1House")
            defaults.set(utilities, forKey: "budget1Utilities")
            defaults.set(bills, forKey: "budget1Bills")
            defaults.set(tuition, forKey: "budget1Tuition")
            defaults.set(insurance, forKey: "budget1Insurance")
            defaults.set(car, forKey: "budget1Car")
            defaults.set(memberships, forKey: "budget1Memberships")
            defaults.set(charity, forKey: "budget1Charity")
            defaults.set(other, forKey: "budget1Other")
        } else if (budgetNumber == 2) {
            defaults.set(house, forKey: "budget2House")
            defaults.set(utilities, forKey: "budget2Utilities")
            defaults.set(bills, forKey: "budget2Bills")
            defaults.set(tuition, forKey: "budget2Tuition")
            defaults.set(insurance, forKey: "budget2Insurance")
            defaults.set(car, forKey: "budget2Car")
            defaults.set(memberships, forKey: "budget2Memberships")
            defaults.set(charity, forKey: "budget2Charity")
            defaults.set(other, forKey: "budget2Other")
        } else if (budgetNumber == 3) {
            defaults.set(house, forKey: "budget3House")
            defaults.set(utilities, forKey: "budget3Utilities")
            defaults.set(bills, forKey: "budget3Bills")
            defaults.set(tuition, forKey: "budget3Tuition")
            defaults.set(insurance, forKey: "budget3Insurance")
            defaults.set(car, forKey: "budget3Car")
            defaults.set(memberships, forKey: "budget3Memberships")
            defaults.set(charity, forKey: "budget3Charity")
            defaults.set(other, forKey: "budget3Other")
        } else {
            print (" ERROR - no budget number found. Err CODE 44293e3")
        }
                
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Loading") as! Loading
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
            
            
    }
    
    
    func textFieldShouldReturn(_ textField2: UITextField) -> Bool {
        
        return true
    }
    
    /*
     0 Rent/mortgage
     1 Utilities
     2 Bills (Phone, internet, television)
     3 Tuition
     4 Insurance
     5 Car Payment
     6 Other Debt Payments
     7 Charity
     8 Memberships
     9 Subscriptions (+ Other repeating expenses like a parking pass)
     */
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func textFieldEditingDidChange1(_ sender: Any) {
        textUpdate1()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange2(_ sender: Any) {
        textUpdate2()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange3(_ sender: Any) {
        textUpdate3()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange4(_ sender: Any) {
        textUpdate4()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange5(_ sender: Any) {
        textUpdate5()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange6(_ sender: Any) {
        textUpdate6()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange7(_ sender: Any) {
        textUpdate7()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange8(_ sender: Any) {
        textUpdate8()
        updateTotal()
    }
    @IBAction func textFieldEditingDidChange9(_ sender: Any) {
        textUpdate9()
        updateTotal()
    }
    
    func updateTotal() {
        
        if (houseTextField.hasText) && (houseTextField.text != "$") {
            let houseText = houseTextField.text!
            let index = houseText.index(houseText.endIndex, offsetBy: -1 * houseText.count + 1)
            let substring = houseText.suffix(from: index)
            house = Int(substring) ?? 0
        }
        
        if (utilitiesTextField.hasText) && (utilitiesTextField.text != "$") {
            let utilitiesText = utilitiesTextField.text!
            let index = utilitiesText.index(utilitiesText.endIndex, offsetBy: -1 * utilitiesText.count + 1)
            let substring = utilitiesText.suffix(from: index)
            utilities = Int(substring) ?? 0
        }
        
        if (billsTextField.hasText) && (billsTextField.text != "$") {
            let billsText = billsTextField.text!
            let index = billsText.index(billsText.endIndex, offsetBy: -1 * billsText.count + 1)
            let substring = billsText.suffix(from: index)
            bills = Int(substring) ?? 0
        }
        
        if (tuitionTextField.hasText) && (tuitionTextField.text != "$") {
            let tuitionText = tuitionTextField.text!
            let index = tuitionText.index(tuitionText.endIndex, offsetBy: -1 * tuitionText.count + 1)
            let substring = tuitionText.suffix(from: index)
            tuition = Int(substring) ?? 0
        }
        
        if (insuranceTextField.hasText) && (insuranceTextField.text != "$") {
            let insuranceText = insuranceTextField.text!
            let index = insuranceText.index(insuranceText.endIndex, offsetBy: -1 * insuranceText.count + 1)
            let substring = insuranceText.suffix(from: index)
            insurance = Int(substring) ?? 0
        }
        
        if (carTextField.hasText) && (carTextField.text != "$") {
            let carText = carTextField.text!
            let index = carText.index(carText.endIndex, offsetBy: -1 * carText.count + 1)
            let substring = carText.suffix(from: index)
            car = Int(substring) ?? 0
        }
        
        if (membershipTextField.hasText) && (membershipTextField.text != "$") {
            let membershipText = membershipTextField.text!
            let index = membershipText.index(membershipText.endIndex, offsetBy: -1 * membershipText.count + 1)
            let substring = membershipText.suffix(from: index)
            memberships = Int(substring) ?? 0
        }
        
        if (charityTextField.hasText) && (charityTextField.text != "$") {
            let charityText = charityTextField.text!
            let index = charityText.index(charityText.endIndex, offsetBy: -1 * charityText.count + 1)
            let substring = charityText.suffix(from: index)
            charity = Int(substring) ?? 0
        }
        
        if (otherTextField.hasText) && (otherTextField.text != "$") {
            let otherText = otherTextField.text!
            let index = otherText.index(otherText.endIndex, offsetBy: -1 * otherText.count + 1)
            let substring = otherText.suffix(from: index)
            other = Int(substring) ?? 0
        }
        
        let combinedExpenses = house + utilities + bills + tuition + insurance + car + memberships + charity + other
        totalLabel.text = "Total Monthly Expenses: \n$\(combinedExpenses)"
        
    }
    
    
    func textUpdate1() {
        var text = houseTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                houseTextField.text = "$"
            } else {
                houseTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                houseTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    houseTextField.text = "$"
                } else {
                    houseTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate2() {
        var text = utilitiesTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                utilitiesTextField.text = "$"
            } else {
                utilitiesTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                utilitiesTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    utilitiesTextField.text = "$"
                } else {
                    utilitiesTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate3() {
        var text = billsTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                billsTextField.text = "$"
            } else {
                billsTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                billsTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    billsTextField.text = "$"
                } else {
                    billsTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate4() {
        var text = tuitionTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                tuitionTextField.text = "$"
            } else {
                tuitionTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                tuitionTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    tuitionTextField.text = "$"
                } else {
                    tuitionTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate5() {
        var text = insuranceTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                insuranceTextField.text = "$"
            } else {
                insuranceTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                insuranceTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    insuranceTextField.text = "$"
                } else {
                    insuranceTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate6() {
        var text = carTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                carTextField.text = "$"
            } else {
                carTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                carTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    carTextField.text = "$"
                } else {
                    carTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate7() {
        var text = membershipTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                membershipTextField.text = "$"
            } else {
                membershipTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                membershipTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    membershipTextField.text = "$"
                } else {
                    membershipTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate8() {
        var text = charityTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                charityTextField.text = "$"
            } else {
                charityTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                charityTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    charityTextField.text = "$"
                } else {
                    charityTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    func textUpdate9() {
        var text = otherTextField.text ?? ""
        if (text.count == 0){
            text = "$"
        } else if (text.count == 1){
            let index = text.index(text.endIndex, offsetBy: -1 * text.count)
            let substring = text.suffix(from: index)
            if (substring == "$") {
                otherTextField.text = "$"
            } else {
                otherTextField.text = "$\(substring)"
            }
        } else {
            let firstIndex = text.index(text.startIndex, offsetBy: 1)
            let firstSub = text.prefix(upTo: firstIndex)
            if (firstSub == "$") {
            let index = text.index(text.endIndex, offsetBy: -1 * text.count + 1)
            let substring = text.suffix(from: index)
                otherTextField.text = "$\(substring)"
            } else {
                let index = text.index(text.endIndex, offsetBy: -1 * text.count)
                let substring = text.suffix(from: index)
                if (substring == "$") {
                    otherTextField.text = "$"
                } else {
                    otherTextField.text = "$\(substring)"
                }
            }
        }
    }
    
    
    func openingAnimations() {
        
        
        
    }
    
    func start() {
        houseTextField.becomeFirstResponder()
    }
    func stop() {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.numberOfLines = 0
        totalLabel.text = "Total Monthly Expenses: \n"
        totalLabel.layer.masksToBounds = true
        totalLabel.layer.cornerRadius = 10.0
        
        houseTextField.layer.borderWidth = 2.0
        houseTextField.layer.borderColor = UIColor.gray.cgColor
        houseTextField.layer.cornerRadius = 10.0
        
        utilitiesTextField.layer.borderWidth = 2.0
        utilitiesTextField.layer.borderColor = UIColor.gray.cgColor
        utilitiesTextField.layer.cornerRadius = 10.0
        
        billsTextField.layer.borderWidth = 2.0
        billsTextField.layer.borderColor = UIColor.gray.cgColor
        billsTextField.layer.cornerRadius = 10.0
        
        tuitionTextField.layer.borderWidth = 2.0
        tuitionTextField.layer.borderColor = UIColor.gray.cgColor
        tuitionTextField.layer.cornerRadius = 10.0
        
        insuranceTextField.layer.borderWidth = 2.0
        insuranceTextField.layer.borderColor = UIColor.gray.cgColor
        insuranceTextField.layer.cornerRadius = 10.0
        
        carTextField.layer.borderWidth = 2.0
        carTextField.layer.borderColor = UIColor.gray.cgColor
        carTextField.layer.cornerRadius = 10.0
        
        membershipTextField.layer.borderWidth = 2.0
        membershipTextField.layer.borderColor = UIColor.gray.cgColor
        membershipTextField.layer.cornerRadius = 10.0
        
        charityTextField.layer.borderWidth = 2.0
        charityTextField.layer.borderColor = UIColor.gray.cgColor
        charityTextField.layer.cornerRadius = 10.0
        
        otherTextField.layer.borderWidth = 2.0
        otherTextField.layer.borderColor = UIColor.gray.cgColor
        otherTextField.layer.cornerRadius = 10.0

        

        houseTextField.addTarget(self, action: #selector(textFieldEditingDidChange1(_:)), for: .editingChanged)
        houseTextField.delegate = self
        utilitiesTextField.addTarget(self, action: #selector(textFieldEditingDidChange2(_:)), for: .editingChanged)
        utilitiesTextField.delegate = self
        billsTextField.addTarget(self, action: #selector(textFieldEditingDidChange3(_:)), for: .editingChanged)
        billsTextField.delegate = self
        tuitionTextField.addTarget(self, action: #selector(textFieldEditingDidChange4(_:)), for: .editingChanged)
        tuitionTextField.delegate = self
        insuranceTextField.addTarget(self, action: #selector(textFieldEditingDidChange5(_:)), for: .editingChanged)
        insuranceTextField.delegate = self
        carTextField.addTarget(self, action: #selector(textFieldEditingDidChange6(_:)), for: .editingChanged)
        carTextField.delegate = self
        membershipTextField.addTarget(self, action: #selector(textFieldEditingDidChange7(_:)), for: .editingChanged)
        membershipTextField.delegate = self
        charityTextField.addTarget(self, action: #selector(textFieldEditingDidChange8(_:)), for: .editingChanged)
        charityTextField.delegate = self
        otherTextField.addTarget(self, action: #selector(textFieldEditingDidChange9(_:)), for: .editingChanged)
        otherTextField.delegate = self
        
        budgetNumber = defaults.integer(forKey: "budgetCreation")
        
        
        backButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        continueButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon1.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon2.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon3.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon4.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon5.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon6.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon7.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon8.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        icon9.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)


        

        let delayTime = DispatchTime.now() + 0.01
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.openingAnimations()
        })
        let delayTime2 = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: delayTime2, execute: {
            self.start()
        })
        
        
    }
    

}
