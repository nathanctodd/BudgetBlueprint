//
//  HomeHub.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 1/15/22.
//

import Foundation
import UIKit


class HomeHub: UIViewController {
    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundView1: UIView!
    @IBOutlet weak var backgroundView2: UIView!
    @IBOutlet weak var backgroundView3: UIView!
    
    @IBOutlet weak var updateButton1: UIButton!
    @IBOutlet weak var updateButton2: UIButton!
    @IBOutlet weak var updateButton3: UIButton!
    @IBOutlet weak var editButton1: UIButton!
    @IBOutlet weak var editButton2: UIButton!
    @IBOutlet weak var editButton3: UIButton!
    
    @IBOutlet weak var checkmark1: UIImageView!
    @IBOutlet weak var checkmark2: UIImageView!
    @IBOutlet weak var checkmark3: UIImageView!
    @IBOutlet weak var checkmarkLabel1: UILabel!
    @IBOutlet weak var checkmarkLabel2: UILabel!
    @IBOutlet weak var checkmarkLabel3: UILabel!
    
    @IBOutlet weak var budgetTitle1: UILabel!
    @IBOutlet weak var budgetTitle2: UILabel!
    @IBOutlet weak var budgetTitle3: UILabel!
    @IBOutlet weak var goalLabel1: UILabel!
    @IBOutlet weak var goalLabel2: UILabel!
    @IBOutlet weak var goalLabel3: UILabel!
    @IBOutlet weak var totalSavingsLabel1: UILabel!
    @IBOutlet weak var totalSavingsLabel2: UILabel!
    @IBOutlet weak var totalSavingsLabel3: UILabel!
    
    @IBOutlet weak var createBudgetButton1: UIButton!
    @IBOutlet weak var createBudgetButton2: UIButton!
    @IBOutlet weak var createBudgetButton3: UIButton!
    
    let defaults = UserDefaults.standard
    var budget1Complete = false
    var budget2Complete = false
    var budget3Complete = false

    
    
    @IBAction func edit1(_ sender: Any) {
        defaults.set(1, forKey: "budgetEdit")
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "IncomeInput") as! IncomeInput
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)

    }
    @IBAction func edit2(_ sender: Any) {
        defaults.set(2, forKey: "budgetEdit")
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "IncomeInput") as! IncomeInput
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)

    }
    @IBAction func edit3(_ sender: Any) {
        defaults.set(3, forKey: "budgetEdit")
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "IncomeInput") as! IncomeInput
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func update1(_ sender: Any) {
        
        if budget1Complete == false {
            defaults.set(1, forKey: "budgetUpdate")
            defaults.set(1, forKey: "budgetUpdateIndex")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "UpdateBudget") as! UpdateBudget
            viewController.modalPresentationStyle = .popover
            self.present(viewController, animated: true, completion: nil)
        } else {
            defaults.set(true, forKey: "budget1Complete")
            defaults.set(1, forKey: "budgetOverview")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: true, completion: nil)
        }
        
    }
    @IBAction func update2(_ sender: Any) {
        
        if budget2Complete == false {
            defaults.set(2, forKey: "budgetUpdate")
            defaults.set(1, forKey: "budgetUpdateIndex")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "UpdateBudget") as! UpdateBudget
            viewController.modalPresentationStyle = .popover
            self.present(viewController, animated: true, completion: nil)
            
        } else {
            defaults.set(true, forKey: "budget2Complete")
            defaults.set(2, forKey: "budgetOverview")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: true, completion: nil)
        }
        
    }
    @IBAction func update3(_ sender: Any) {
        
        if budget3Complete == false {
            defaults.set(3, forKey: "budgetUpdate")
            defaults.set(1, forKey: "budgetUpdateIndex")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "UpdateBudget") as! UpdateBudget
            viewController.modalPresentationStyle = .popover
            self.present(viewController, animated: true, completion: nil)
        } else {
            defaults.set(true, forKey: "budget3Complete")
            defaults.set(3, forKey: "budgetOverview")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    
    func goToNext() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "BudgetName") as! BudgetName
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    
  
    
    
    @IBAction func create1(_ sender: Any) {
        let budget1Exists = defaults.bool(forKey: "budget1Exists")
        if !budget1Exists {
            defaults.set(1, forKey: "budgetCreation")
            goToNext()
        } else {
            defaults.set(1, forKey: "budgetOverview")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
        
    }
    @IBAction func create2(_ sender: Any) {
        let budget2Exists = defaults.bool(forKey: "budget2Exists")
        if !budget2Exists {
            defaults.set(2, forKey: "budgetCreation")
            goToNext()
        } else {
            defaults.set(2, forKey: "budgetOverview")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    @IBAction func create3(_ sender: Any) {
        let budget3Exists = defaults.bool(forKey: "budget3Exists")
        if !budget3Exists {
            defaults.set(3, forKey: "budgetCreation")
            goToNext()
        } else {
            defaults.set(3, forKey: "budgetOverview")
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        
        let name = defaults.string(forKey: "name")
        nameLabel.text = name
        
        budgetTitle1.isHidden = true
        budgetTitle2.isHidden = true
        budgetTitle3.isHidden = true
        goalLabel1.isHidden = true
        goalLabel2.isHidden = true
        goalLabel3.isHidden = true
        totalSavingsLabel1.isHidden = true
        totalSavingsLabel2.isHidden = true
        totalSavingsLabel3.isHidden = true
        editButton1.isHidden = true
        editButton2.isHidden = true
        editButton3.isHidden = true
        updateButton1.isHidden = true
        updateButton2.isHidden = true
        updateButton3.isHidden = true
        createBudgetButton1.isHidden = false
        createBudgetButton2.isHidden = false
        createBudgetButton3.isHidden = false
        editButton1.setTitle("Edit", for: .normal)
        editButton2.setTitle("Edit", for: .normal)
        editButton3.setTitle("Edit", for: .normal)
        checkmark1.isHidden = true
        checkmark2.isHidden = true
        checkmark3.isHidden = true
        checkmarkLabel1.isHidden = true
        checkmarkLabel2.isHidden = true
        checkmarkLabel3.isHidden = true

        
        var budget1Exists = false;
        var budget2Exists = false;
        var budget3Exists = false;

        budget1Exists = defaults.bool(forKey: "budget1Exists")
        budget2Exists = defaults.bool(forKey: "budget2Exists")
        budget3Exists = defaults.bool(forKey: "budget3Exists")
        
        if (budget1Exists == true) {
            
            budgetTitle1.isHidden = false;
            goalLabel1.isHidden = false;
            totalSavingsLabel1.isHidden = false;
            editButton1.isHidden = false;
            updateButton1.isHidden = false;
            createBudgetButton1.setTitle("", for: .normal)
            createBudgetButton1.setTitleColor(UIColor.black, for: .normal)
            createBudgetButton1.alpha = 0.0100001
            let title1 = defaults.string(forKey: "budget1Title");
            budgetTitle1.text = title1
            let goalAmount1 = defaults.integer(forKey: "budget1Expense");
            goalLabel1.text = "Goal: $\(goalAmount1).00"
            let totalSavings1 = defaults.integer(forKey: "budget1TotalSavings")
            totalSavingsLabel1.text = "Total Savings: $\(totalSavings1).00"
            if totalSavings1 >= goalAmount1 {
                checkmark1.isHidden = false
                checkmarkLabel1.isHidden = false
                updateButton1.setTitle("Finish", for: .normal)
                budget1Complete = true
            }
            
        }

        if (budget2Exists == true) {
            
            budgetTitle2.isHidden = false;
            goalLabel2.isHidden = false;
            totalSavingsLabel2.isHidden = false;
            editButton2.isHidden = false;
            updateButton2.isHidden = false;
            createBudgetButton2.setTitle("", for: .normal)
            createBudgetButton2.setTitleColor(UIColor.black, for: .normal)
            createBudgetButton2.alpha = 0.0100001
            let title2 = defaults.string(forKey: "budget2Title");
            budgetTitle2.text = title2
            let goalAmount2 = defaults.integer(forKey: "budget2Expense");
            goalLabel2.text = "Goal: $\(goalAmount2).00"
            let totalSavings2 = defaults.integer(forKey: "budget2TotalSavings")
            totalSavingsLabel2.text = "Total Savings: $\(totalSavings2).00"
            if totalSavings2 >= goalAmount2 {
                checkmark2.isHidden = false
                checkmarkLabel2.isHidden = false
                updateButton2.setTitle("Finish", for: .normal)
                budget2Complete = true
            }
        }
        
        if (budget3Exists == true) {
            
            budgetTitle3.isHidden = false;
            goalLabel3.isHidden = false;
            totalSavingsLabel3.isHidden = false;
            editButton3.isHidden = false;
            updateButton3.isHidden = false;
            createBudgetButton3.setTitle("", for: .normal)
            createBudgetButton3.setTitleColor(UIColor.black, for: .normal)
            createBudgetButton3.alpha = 0.0100001
            let title3 = defaults.string(forKey: "budget3Title");
            budgetTitle3.text = title3
            let goalAmount3 = defaults.integer(forKey: "budget3Expense");
            goalLabel3.text = "Goal: $\(goalAmount3).00"
            let totalSavings3 = defaults.integer(forKey: "budget3TotalSavings")
            totalSavingsLabel3.text = "Total Savings: $\(totalSavings3).00"
            if totalSavings3 >= goalAmount3 {
                checkmark3.isHidden = false
                checkmarkLabel3.isHidden = false
                updateButton3.setTitle("Finish", for: .normal)
                budget3Complete = true
            }
        }

        
        backgroundView1.layer.cornerRadius = 10.0
        backgroundView2.layer.cornerRadius = 10.0
        backgroundView3.layer.cornerRadius = 10.0
        
        createBudgetButton1.layer.cornerRadius = 10.0
        createBudgetButton2.layer.cornerRadius = 10.0
        createBudgetButton3.layer.cornerRadius = 10.0
        
        budgetTitle1.adjustsFontSizeToFitWidth = true
        budgetTitle2.adjustsFontSizeToFitWidth = true
        budgetTitle3.adjustsFontSizeToFitWidth = true
        nameLabel.adjustsFontSizeToFitWidth = true

        
        createBudgetButton1.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
        createBudgetButton2.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
        createBudgetButton3.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
        
        createBudgetButton1.setTitleColor(UIColor.black, for: .normal)
        createBudgetButton2.setTitleColor(UIColor.black, for: .normal)
        createBudgetButton3.setTitleColor(UIColor.black, for: .normal)

        
        editButton1.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        editButton2.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        editButton3.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        updateButton1.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        updateButton2.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        updateButton3.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        profile.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)

        
        createBudgetButton1.setTitleColor(UIColor.black, for: .normal)
        createBudgetButton2.setTitleColor(UIColor.black, for: .normal)
        createBudgetButton3.setTitleColor(UIColor.black, for: .normal)
        
        
    }
    
}
