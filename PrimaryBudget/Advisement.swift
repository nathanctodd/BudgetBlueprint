//
//  Advisement.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 12/21/21.
//

import Foundation
import UIKit


extension Advisement : UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptions.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 152.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! customTableCell
        cell.titleLabel?.text = "\(titles[indexPath.row])"
        cell.titleLabel?.adjustsFontSizeToFitWidth = true
        cell.editButton?.tag = indexPath.row
        cell.editButton?.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
        cell.editButton?.tintColor = UIColor(red: 108/255, green: 163/255, blue: 246/255, alpha: 1.0)

        
        switch imageIndexes[indexPath.row] {
        case 0:
            cell.statusImage?.tintColor = .red
            cell.statusImage?.image = UIImage(systemName: "xmark.circle.fill")
            cell.descriptionLabel?.text = "Consider revising this field."
            break
        case 1:
            cell.statusImage?.tintColor = UIColor(red: 248/255, green: 172/255, blue: 8/255, alpha: 1.0)
            cell.statusImage?.image = UIImage(systemName: "exclamationmark.triangle.fill")
            cell.descriptionLabel?.text = "Consider revising this field."
            break
        case 2:
            cell.statusImage?.tintColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1.0)
            cell.statusImage?.image = UIImage(systemName: "checkmark.circle.fill")
            cell.descriptionLabel?.text = "Your input looks good!"
        default:
            cell.statusImage?.tintColor = UIColor(red: 248/255, green: 172/255, blue: 8/255, alpha: 1.0)
            cell.statusImage?.image = UIImage(systemName: "exclamationmark.triangle.fill")
            break
        }
        return cell
    }
    
    @objc func buttonSelected(sender: UIButton) {
        
    
        
        print(sender.tag)
        let action = actionIndex[sender.tag]
        print(action)
        switch action {
        case 0:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        case 1:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        case 2:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        case 3:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        case 4:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        case 5:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        case 6:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        case 7:
            defaults.set(action, forKey: "expenseNumber")
            defaults.set(descriptions[sender.tag], forKey: "descript")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SingleExpense") as! SingleExpense
            newViewController.modalPresentationStyle = .popover
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
            break
        default:
            
            break
        }
        //Switch statement for the sender.tag with functions for each of the other parts
    }
    
}






class Advisement : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    let defaults = UserDefaults.standard
    var titles = [""]
    var descriptions = [""]
    var imageIndexes = [0]
    var actionIndex = [0]
    var name = ""
    var budgetName = ""
    var targetExpenseCost = 0
    var startBalance = 0
    var currentIncome = 0
    var incomeIndex = 0
    var house = 0
    var utilities = 0
    var bills = 0
    var tuition = 0
    var insurance = 0
    var car = 0
    var charity = 0
    var memberships = 0
    var other = 0
    
    var targetDate: Date = Date()
    var startingDate: Date = Date()
    
    
    //Creation of the vainas
  
    
    @IBAction func next(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "Home") as! Home
        newVC.modalPresentationStyle = .fullScreen
        newVC.modalTransitionStyle = .crossDissolve
        self.present(newVC, animated: true, completion: nil)
        
    }

    
    override func viewDidLoad() {
        
        
        let budgetOverview = defaults.integer(forKey: "budgetCreation")
        
        nextButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)

        
        if budgetOverview == 1 {
            name = defaults.string(forKey: "name") ?? ""
            budgetName = defaults.string(forKey: "budget1Title") ?? ""
            targetExpenseCost = defaults.integer(forKey: "budget1Expense")
            startBalance = defaults.integer(forKey: "budget1StartBalance")
            currentIncome = defaults.integer(forKey: "budget1ExpectedIncome")
            incomeIndex = defaults.integer(forKey: "budget1IncomeIndex")
            house = defaults.integer(forKey: "budget1House")
            utilities = defaults.integer(forKey: "budget1Utilities")
            bills = defaults.integer(forKey: "budget1Bills")
            tuition = defaults.integer(forKey: "budget1Tuition")
            insurance = defaults.integer(forKey: "budget1Insurance")
            car = defaults.integer(forKey: "budget1Car")
            other = defaults.integer(forKey: "budget1Other")
            charity = defaults.integer(forKey: "budget1Charity")
            memberships = defaults.integer(forKey: "budget1Memberships")
            targetDate = defaults.object(forKey: "budget1EndDate") as! Date
            startingDate = defaults.object(forKey: "budget1StartingDate") as! Date
            
        } else if budgetOverview == 2 {
            name = defaults.string(forKey: "name") ?? ""
            budgetName = defaults.string(forKey: "budget2Title") ?? ""
            targetExpenseCost = defaults.integer(forKey: "budget2Expense")
            startBalance = defaults.integer(forKey: "budget2StartBalance")
            currentIncome = defaults.integer(forKey: "budget2ExpectedIncome")
            incomeIndex = defaults.integer(forKey: "budget2IncomeIndex")
            house = defaults.integer(forKey: "budget2House")
            utilities = defaults.integer(forKey: "budget2Utilities")
            bills = defaults.integer(forKey: "budget2Bills")
            tuition = defaults.integer(forKey: "budget2Tuition")
            insurance = defaults.integer(forKey: "budget2Insurance")
            car = defaults.integer(forKey: "budget2Car")
            other = defaults.integer(forKey: "budget2Other")
            charity = defaults.integer(forKey: "budget2Charity")
            memberships = defaults.integer(forKey: "budget2Memberships")
            targetDate = defaults.object(forKey: "budget2EndDate") as! Date
            startingDate = defaults.object(forKey: "budget2StartingDate") as! Date
            
        } else if budgetOverview == 3 {
            name = defaults.string(forKey: "name") ?? ""
            budgetName = defaults.string(forKey: "budget3Title") ?? ""
            targetExpenseCost = defaults.integer(forKey: "budget3Expense")
            startBalance = defaults.integer(forKey: "budget3StartBalance")
            currentIncome = defaults.integer(forKey: "budget3ExpectedIncome")
            incomeIndex = defaults.integer(forKey: "budget3IncomeIndex")
            house = defaults.integer(forKey: "budget3House")
            utilities = defaults.integer(forKey: "budget3Utilities")
            bills = defaults.integer(forKey: "budget3Bills")
            tuition = defaults.integer(forKey: "budget3Tuition")
            insurance = defaults.integer(forKey: "budget3Insurance")
            car = defaults.integer(forKey: "budget3Car")
            other = defaults.integer(forKey: "budget3Other")
            charity = defaults.integer(forKey: "budget3Charity")
            memberships = defaults.integer(forKey: "budget3Memberships")
            targetDate = defaults.object(forKey: "budget3EndDate") as! Date
            startingDate = defaults.object(forKey: "budget3StartingDate") as! Date
            
        } else {
            
        }
        
        
        let calendar = Calendar.current
        let date2 = calendar.startOfDay(for: targetDate)
        let date3 = calendar.startOfDay(for: startingDate)
        
        let components = calendar.dateComponents([.day], from: date3, to: date2)

        
        if (incomeIndex == 0) {
            currentIncome = currentIncome * 4
        } else if (incomeIndex == 2) {
            currentIncome = currentIncome / 12
        }
        
        titles.removeAll()
        descriptions.removeAll()
        imageIndexes.removeAll()
        actionIndex.removeAll()
        
    //Income
        
        print(descriptions.count, titles.count)

        
        if (Double(house) > Double(currentIncome * 4) * 0.30) {
            titles.append("House Adjustment")
            descriptions.append("Your house payment is above the averge payment for a house of %30 of your monthly income. Consider finding a space to live with a lower rent or mortgage payment.")
            imageIndexes.append(0)
            actionIndex.append(0)
        } else {
            titles.append("House Adjustment")
            descriptions.append("Your house payment looks about right!")
            imageIndexes.append(2)
            actionIndex.append(0)
        }
        
        if (Double(bills) > Double(currentIncome * 4) * 0.2) {
            titles.append("Groceries Payments")
            descriptions.append("Currently, you are spending more than %20 of your income on groceries and personal items. Consider cutting back and budgeting when going to the grocery store. We recommend that you don't spend more than $\(Double(currentIncome * 4) * 0.2) on your groceries, based off of your current income.")
            imageIndexes.append(0)
            actionIndex.append(1)
        } else {
            titles.append("Groceries Payments")
            descriptions.append("Your grocery payments look about great!")
            imageIndexes.append(2)
            actionIndex.append(1)
        }
        print(descriptions.count, titles.count)

        if (Double(car) > Double(currentIncome * 4) * 0.15) {
            titles.append("Transportation Payments")
            descriptions.append("Currently, you are spending more than %15 of your income on transportation, car payments and gas. Consider trying other options to save money, such as taking public transportation, carpooling, and also buying a car that is within your means. We recommend you don't spend more than $\(Double(currentIncome * 4) * 0.2) per month on your transportation payments.")
            imageIndexes.append(0)
            actionIndex.append(2)
        } else {
            titles.append("Transportation Payments")
            descriptions.append("Your transportation payments look good!")
            imageIndexes.append(2)
            actionIndex.append(2)
        }
        
        if (Double(utilities) > Double(currentIncome * 4) * 0.16) {
            titles.append("Bill and Utility Payments")
            descriptions.append("You are spending more than %16 of your income on utilities and bills. Try cutting down this expense by cutting back on water, electricity, and gas. Also consider finding better deals and rates for the rest of your bills and utilities.")
            imageIndexes.append(0)
            actionIndex.append(3)
        } else {
            titles.append("Bill and Utility Payments")
            descriptions.append("Your payments are looking good!")
            imageIndexes.append(2)
            actionIndex.append(3)
        }
        print(descriptions.count, titles.count)

        if (Double(insurance) > Double(currentIncome * 4) * 0.05) {
            titles.append("Insurance Payments")
            descriptions.append("Right now, you are spending more than 5% of your income on insurance. We recommend cutting back on your insurnace or finding a new plan so that you are not spending more than $\(Double(currentIncome * 4) * 0.05) per month on your insurance.")
            imageIndexes.append(0)
            actionIndex.append(4)
            print(descriptions.count, titles.count, "BRUH!")
        } else {
            titles.append("Insurance Payments")
            descriptions.append("Your insurance payments are looking good!")
            imageIndexes.append(2)
            actionIndex.append(4)
            print(descriptions.count, titles.count, "BRUH!!!!!!!")

        }
        
        if (Double(memberships) > Double(currentIncome * 4) * 0.05) {
            titles.append("Membership Cost")
            descriptions.append("Right now, you are spending more than 5% of your income on different memberhips. We recommend taking out all unnessesary memberships so that you spend less than $\(Double(currentIncome * 4) * 0.05)")
            imageIndexes.append(0)
            actionIndex.append(5)
        } else {
            titles.append("Membership Payments")
            descriptions.append("Your membership payments are looking good!")
            imageIndexes.append(2)
            actionIndex.append(5)
        }
        print(descriptions.count, titles.count)

        
        if (Double(charity) > Double(currentIncome) * 0.15) {
            titles.append("Charity Adjustment")
            descriptions.append("The donation amount that you have entered is more than 10% of your total income - consider revising charity donations.")
            imageIndexes.append(0)
            actionIndex.append(6)
        } else {
            titles.append("Charity Adjustment")
            descriptions.append("The charity donations look good!")
            imageIndexes.append(2)
            actionIndex.append(6)
        }
        
        if (currentIncome < 300) {
            titles.append("Increase Income")
            descriptions.append("Another way to help budgeting is to increase income. Currently you are making less than $300 a week, so we adivse that you look for ways to increase income.")
            imageIndexes.append(0)
            actionIndex.append(7)
        } else {
            titles.append("Increase Income")
            descriptions.append("Your income should be enough for your budget!")
            imageIndexes.append(2)
            actionIndex.append(7)
        }
        
        
        
        
        
    }
    
}
