//
//  HomeScreen.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 12/22/21.
//

import Foundation
import UIKit


class HomeScreen: UIViewController {
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testImage2: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var budgetTitle: UILabel!
    @IBOutlet weak var savingsBackground: UIView!
    
    @IBOutlet weak var savingsPerWeekLabel: UILabel!
    @IBOutlet weak var actualSavingsPerWeek: UILabel!
    @IBOutlet weak var goalSavingsLabel: UILabel!
    @IBOutlet weak var actualGoalSavings: UILabel!
    
    @IBOutlet weak var totalSavingsLabel: UILabel!
    @IBOutlet weak var actualTotalSavings: UILabel!
    
    @IBOutlet weak var percentSavingsLabel: UILabel!
    @IBOutlet weak var percentTimeRemaining: UILabel!
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var actualTimeRemaining: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
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
    var totalEarnings = 0
    var totalSavings = 0
    var totalSavingsPercentage = 0.0
    var targetDate: Date = Date()
    var startingDate: Date = Date()
    var budgetComplete = false


    
    var percentOfDaysPassed: Float!
    var percentSaved: Float!
    
    let defaults = UserDefaults.standard
    
    @objc func animateProgress(valueToFill: Float) {
        let cp = self.view.viewWithTag(101) as! CircularProgress
        cp.setProgressWithAnimation(duration: 0.8, value: Float(totalSavingsPercentage))
    }
    @objc func animateProgress2(valueToFill: Float) {
        let cp = self.view.viewWithTag(102) as! CircularProgress
        cp.setProgressWithAnimation(duration: 0.8, value: percentOfDaysPassed)
    }
    
    @IBAction func goBack(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewC = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
        viewC.modalTransitionStyle = .crossDissolve
        viewC.modalPresentationStyle = .fullScreen
        self.present(viewC, animated: true, completion: nil)
    }
    
    @IBAction func updateFunction(_ sender: Any) {
        
        if budgetComplete == true {

            let budgetOverview = defaults.integer(forKey: "budgetOverview")
            
            if (budgetOverview == 1) {
                defaults.set("", forKey: "budget1Title")
                defaults.set(0, forKey: "budget1Expense")
                defaults.set(0, forKey: "budget1StartBalance")
                defaults.set(0, forKey: "budget1ExpectedIncome")
                defaults.set(0, forKey: "budget1IncomeIndex")
                defaults.set(0, forKey: "budget1House")
                defaults.set(0, forKey: "budget1Utilities")
                defaults.set(0, forKey: "budget1Bills")
                defaults.set(0, forKey: "budget1Tuition")
                defaults.set(0, forKey: "budget1Insurance")
                defaults.set(0, forKey: "budget1Car")
                defaults.set(0, forKey: "budget1Other")
                defaults.set(0, forKey: "budget1Charity")
                defaults.set(0, forKey: "budget1Memberships")
                defaults.set(0, forKey: "budgetOverview")
                defaults.set(false, forKey: "budget1Complete")
                defaults.set(0, forKey: "budget1TotalSavings")
                defaults.set(0, forKey: "budget1Creation")
                defaults.set(false, forKey: "budget1Exists")
            } else if budgetOverview == 2 {
                defaults.set("", forKey: "budget2Title")
                defaults.set(0, forKey: "budget2Expense")
                defaults.set(0, forKey: "budget2StartBalance")
                defaults.set(0, forKey: "budget2ExpectedIncome")
                defaults.set(0, forKey: "budget2IncomeIndex")
                defaults.set(0, forKey: "budget2House")
                defaults.set(0, forKey: "budget2Utilities")
                defaults.set(0, forKey: "budget2Bills")
                defaults.set(0, forKey: "budget2Tuition")
                defaults.set(0, forKey: "budget2Insurance")
                defaults.set(0, forKey: "budget2Car")
                defaults.set(0, forKey: "budget2Other")
                defaults.set(0, forKey: "budget2Charity")
                defaults.set(0, forKey: "budget2Memberships")
                defaults.set(0, forKey: "budgetOverview")
                defaults.set(false, forKey: "budget2Complete")
                defaults.set(0, forKey: "budget2TotalSavings")
                defaults.set(0, forKey: "budget2Creation")
                defaults.set(false, forKey: "budget2Exists")
            } else if budgetOverview == 3 {
                defaults.set("", forKey: "budget3Title")
                defaults.set(0, forKey: "budget3Expense")
                defaults.set(0, forKey: "budget3StartBalance")
                defaults.set(0, forKey: "budget3ExpectedIncome")
                defaults.set(0, forKey: "budget3IncomeIndex")
                defaults.set(0, forKey: "budget3House")
                defaults.set(0, forKey: "budget3Utilities")
                defaults.set(0, forKey: "budget3Bills")
                defaults.set(0, forKey: "budget3Tuition")
                defaults.set(0, forKey: "budget3Insurance")
                defaults.set(0, forKey: "budget3Car")
                defaults.set(0, forKey: "budget3Other")
                defaults.set(0, forKey: "budget3Charity")
                defaults.set(0, forKey: "budget3Memberships")
                defaults.set(0, forKey: "budgetOverview")
                defaults.set(false, forKey: "budget3Complete")
                defaults.set(0, forKey: "budget3TotalSavings")
                defaults.set(0, forKey: "budget3Creation")
                defaults.set(false, forKey: "budget3Exists")
            }
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewC = storyboard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
            viewC.modalPresentationStyle = .fullScreen
            viewC.modalTransitionStyle = .crossDissolve
            self.present(viewC, animated: true, completion: nil)
        } else {
            defaults.set(2, forKey: "budgetUpdateIndex")
            let budgetOverview = defaults.integer(forKey: "budgetOverview")
            if (budgetOverview == 1) {
                defaults.set(1, forKey: "budgetUpdate")
            } else if budgetOverview == 2 {
                defaults.set(2, forKey: "budgetUpdate")
            } else if budgetOverview == 3 {
                defaults.set(3, forKey: "budgetUpdate")
            }
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewC = storyboard.instantiateViewController(withIdentifier: "UpdateBudget") as! UpdateBudget
            viewC.modalPresentationStyle = .popover
            self.present(viewC, animated: true, completion: nil)
        }
    }
    
    
    func openingAnimations() {
        
        let cp = self.view.viewWithTag(101) as! CircularProgress
        let cp2 = self.view.viewWithTag(102) as! CircularProgress

        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
            self.nameLabel.center.x = self.view.frame.midX + 38
            self.budgetTitle.center.x = self.view.frame.midX + 38

        }, completion: {
            finished in
        })
       
        UIView.animate(withDuration: 0.7, delay: 0.50, options: .curveEaseInOut, animations: {
            self.profileIcon.center.x = self.view.frame.midX - 153
            self.profileIcon.alpha = 1.0
        }, completion: {
            finished in
        })
       
        UIView.animate(withDuration: 0.7, delay: 0.68, options: .curveEaseInOut, animations: {
            self.actualSavingsPerWeek.center.x = self.view.frame.midX + 107
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.86, options: .curveEaseInOut, animations: {
            self.savingsPerWeekLabel.center.x = self.view.frame.midX - 83
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.9, options: .curveEaseInOut, animations: {
            self.actualGoalSavings.center.x = self.view.frame.midX + 107
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.7, delay: 1.08, options: .curveEaseInOut, animations: {
            self.goalSavingsLabel.center.x = self.view.frame.midX - 83
        }, completion: {
            finished in
        })
        
        
        UIView.animate(withDuration: 0.7, delay: 1.04, options: .curveEaseInOut, animations: {
            self.totalSavingsLabel.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 1.04, options: .curveEaseInOut, animations: {
            self.actualTotalSavings.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 1.0, delay: 1.22, options: .curveEaseInOut, animations: {
            cp.alpha = 1.0
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.7, delay: 1.94, options: .curveEaseInOut, animations: {
            self.timeRemainingLabel.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 1.94, options: .curveEaseInOut, animations: {
            self.actualTimeRemaining.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 1.0, delay: 2.12, options: .curveEaseInOut, animations: {
            cp2.alpha = 1.0
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 1.0, delay: 2.1, options: .curveEaseInOut, animations: {
            self.percentSavingsLabel.alpha = 1.0
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 1.5, delay: 2.3, options: .curveEaseInOut, animations: {
            self.percentTimeRemaining.alpha = 1.0
        }, completion: {
            finished in
        })
    }

    
    
    override func viewDidLoad() {
        
        testImage.isHidden = true
        testImage2.isHidden = true
        
        let budgetOverview = defaults.integer(forKey: "budgetOverview")
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
            totalSavings = defaults.integer(forKey: "budget1TotalSavings")
            budgetComplete = defaults.bool(forKey: "budget1Complete")
            if (budgetComplete == true) {
                updateButton.setTitle("Clear", for: .normal)
            }
            
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
            totalSavings = defaults.integer(forKey: "budget2TotalSavings")
            budgetComplete = defaults.bool(forKey: "budget2Complete")
            if (budgetComplete == true) {
                updateButton.setTitle("Clear", for: .normal)
            }
            
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
            totalSavings = defaults.integer(forKey: "budget3TotalSavings")
            budgetComplete = defaults.bool(forKey: "budget3Complete")
            if (budgetComplete == true) {
                updateButton.setTitle("Clear", for: .normal)
            }
            
        } else {
            
        }
        
        totalSavingsPercentage = Double(totalSavings) / Double(targetExpenseCost)
        
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: targetDate)
        let date3 = calendar.startOfDay(for: startingDate)
        
        let components = calendar.dateComponents([.day], from: date3, to: date2)
        let components2 = calendar.dateComponents([.day], from: date3, to: date1)
        let components3 = calendar.dateComponents([.day], from: date1, to: date2)

        let totalDays = components.day
        let daysPassed = components2.day
        let daysRemaining = components3.day
        //let weeksRemaining = daysRemaining! / 7
        let weeks = totalDays! / 7
        //let weeksPassed = weeks - weeksRemaining
        percentOfDaysPassed = Float(daysPassed!) / Float(totalDays!)
        actualTimeRemaining.text = "\(daysRemaining!) Days"
        
        if (incomeIndex == 0) {
            currentIncome = currentIncome * 4
        } else if (incomeIndex == 2) {
            currentIncome = currentIncome / 12
        }
        
        let targetSavingsWeekly = (targetExpenseCost - startBalance) / weeks
        //let fixedExpenseValues = house + utilities + bills + tuition + insurance + car + other + charity + memberships
        //let netIncomeAvailableWeekly = currentIncome - fixedExpenseValues
        //let cashAvailableForOtherExpenses = netIncomeAvailableWeekly - targetSavingsWeekly
        let dailySavings = targetSavingsWeekly / 7
        
        
        nameLabel.center.x = 0 - nameLabel.frame.width
        profileIcon.center.x = 0 - profileIcon.frame.width
        budgetTitle.center.x = 0 - budgetTitle.frame.width
        savingsPerWeekLabel.center.x = 0 - savingsPerWeekLabel.frame.width
        actualSavingsPerWeek.center.x = 0 - actualSavingsPerWeek.frame.width
        goalSavingsLabel.center.x = 0 - goalSavingsLabel.frame.width
        actualGoalSavings.center.x = 0 - actualGoalSavings.frame.width
        
        totalSavingsLabel.center.x = 0 - totalSavingsLabel.frame.width
        actualTotalSavings.center.x = 0 - actualTotalSavings.frame.width
        timeRemainingLabel.center.x = 0 - timeRemainingLabel.frame.width
        actualTimeRemaining.center.x = 0 - actualTimeRemaining.frame.width
        
        profileIcon.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        backButton.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        
        actualSavingsPerWeek.text = "$\(targetSavingsWeekly)"
        actualTotalSavings.text = "$\(totalSavings)"
        percentSaved = Float( dailySavings * daysPassed! ) / Float(targetExpenseCost)
        actualGoalSavings.text = "$\(targetExpenseCost)"
        if (totalSavingsPercentage >= 1.0) {
            totalSavingsPercentage = 1.0
        }
        percentSavingsLabel.text = "\(Int(totalSavingsPercentage * 100))%"
        percentSavingsLabel.alpha = 0.0
        percentTimeRemaining.alpha = 0.0
        percentTimeRemaining.text = "\(Int(percentOfDaysPassed * 100))%"
        
        savingsBackground.layer.cornerRadius = 10.0
        
        nameLabel.text = name
        budgetTitle.text = budgetName
        budgetTitle.adjustsFontSizeToFitWidth = true

        let circularProgress = CircularProgress(frame: CGRect(x: 0.0, y: 0.0, width: 150.0, height: 150.0), width: 17.0)
        circularProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        circularProgress.trackColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 0.3)
        circularProgress.tag = 101
        circularProgress.center = CGPoint(x: self.view.center.x + 120, y: self.view.center.y - 70)
        circularProgress.alpha = 0.0
        self.view.addSubview(circularProgress)
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.3)
        
        let timeFrameProgress = CircularProgress(frame: CGRect(x: 0.0, y: 0.0, width: 150.0, height: 150.0), width: 17.0)
        timeFrameProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        timeFrameProgress.trackColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 0.3)
        timeFrameProgress.tag = 102
        timeFrameProgress.center = CGPoint(x: self.view.center.x + 120, y: self.view.frame.midY + 170)
        timeFrameProgress.alpha = 0.0
        self.view.addSubview(timeFrameProgress)
        self.perform(#selector(animateProgress2), with: nil, afterDelay: 2.7)
        
        percentSavingsLabel.textAlignment = .center
        percentTimeRemaining.textAlignment = .center
        percentSavingsLabel.center.y = circularProgress.center.y
        percentTimeRemaining.center.y = timeFrameProgress.center.y
        
        let delay = DispatchTime.now() + 0.01
        DispatchQueue.main.asyncAfter(deadline: delay, execute: {self.openingAnimations()})
        
    }
    
   
    
    
    
    
}
