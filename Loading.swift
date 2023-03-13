//
//  Loading.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 12/16/21.
//

import Foundation
import UIKit



class Loading : UIViewController {
    
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var check: UIImageView!
    
    
    func openingAnimations() {
        UIView.animate(withDuration: 1, delay: 0.02, options: .curveEaseInOut, animations: {
            self.loadingLabel.center.y = self.loadingLabel.center.y + 100
            self.loadingLabel.alpha = 1
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 1, delay: 0.02, options: .curveEaseInOut, animations: {
            self.progress.center.y = self.progress.center.y + 100
            self.progress.alpha = 1
        }, completion: {
            finished in
        })
        
    }
    
    func runProgress() {
        
        progress.progress += 0.01
        if (progress.progress < 1) {
            let delay1 = DispatchTime.now() + 0.04
            DispatchQueue.main.asyncAfter(deadline: delay1, execute: {self.runProgress2()})
        }
        if (progress.progress < 0.4) {
            loadingLabel.text = "Running Calculations..."
        } else if (progress.progress < 0.7) {
            loadingLabel.text = "Accounting for Expenses..."
        } else if (progress.progress < 0.99) {
            loadingLabel.text = "Finishing Up..."
        } else if (progress.progress >= 1) {
            loadingLabel.text = "Budget Calculations Complete"
        }
    }
    
    func runProgress2() {
        
        progress.progress += 0.04
        
        if (progress.progress < 1) {
            let delay1 = DispatchTime.now() + 0.34
            DispatchQueue.main.asyncAfter(deadline: delay1, execute: {self.runProgress3()})
        }
        if (progress.progress < 0.4) {
            loadingLabel.text = "Running Calculations..."
        } else if (progress.progress < 0.7) {
            loadingLabel.text = "Accounting for Expenses..."
        } else if (progress.progress < 0.99) {
            loadingLabel.text = "Finishing Up..."
        } else if (progress.progress >= 1) {
            loadingLabel.text = "Budget Calculations Complete"
        }
    }
    
    func runProgress3() {
        
        progress.progress += 0.06
        if (progress.progress < 1) {
            let delay1 = DispatchTime.now() + 0.15
            DispatchQueue.main.asyncAfter(deadline: delay1, execute: {self.runProgress4()})
        }
        if (progress.progress < 0.4) {
            loadingLabel.text = "Running Calculations..."
        } else if (progress.progress < 0.7) {
            loadingLabel.text = "Accounting for Expenses..."
        } else if (progress.progress < 0.99) {
            loadingLabel.text = "Finishing Up..."
        } else if (progress.progress >= 1) {
            loadingLabel.text = "Budget Calculations Complete"
        }
    }
    
    func runProgress4() {
        
        progress.progress += 0.04
        if (progress.progress < 1) {
            let delay1 = DispatchTime.now() + 0.06
            DispatchQueue.main.asyncAfter(deadline: delay1, execute: {self.runProgress5()})
        }
        if (progress.progress < 0.4) {
            loadingLabel.text = "Running Calculations..."
        } else if (progress.progress < 0.7) {
            loadingLabel.text = "Accounting for Expenses..."
        } else if (progress.progress < 0.99) {
            loadingLabel.text = "Finishing Up..."
        } else if (progress.progress >= 1) {
            loadingLabel.text = "Budget Calculations Complete"
        }
    }
    
    func runProgress5() {
        
        progress.progress += 0.03
        if (progress.progress < 1) {
            let delay1 = DispatchTime.now() + 0.05
            DispatchQueue.main.asyncAfter(deadline: delay1, execute: {self.runProgress()})
        }
        if (progress.progress < 0.4) {
            loadingLabel.text = "Running Calculations..."
        } else if (progress.progress < 0.7) {
            loadingLabel.text = "Accounting for Expenses..."
        } else if (progress.progress < 0.99) {
            loadingLabel.text = "Finishing Up..."
        } else if (progress.progress >= 1) {
            loadingLabel.text = "Budget Calculations Complete"
        }

    }
    
    func nextView() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Home") as! Home
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    func bringInTheCheck() {
        
        UIView.animate(withDuration: 1.0, delay: 0.01, options: .curveEaseInOut, animations: {
            self.check.center.y = self.check.center.y - 100
            self.check.alpha = 1
        }, completion: {
            finished in
        })
        
    }
    
    
    
    override func viewDidLoad() {
        
        loadingLabel.center.y = self.view.frame.midY - 200
        loadingLabel.center.x = self.view.frame.midX
        progress.center.x = self.view.frame.midX
        check.center.x = self.view.frame.midX
        progress.center.y = self.view.frame.midY - 100
        progress.progress = 0.0
        loadingLabel.alpha = 0
        progress.alpha = 0
        check.alpha = 0
        check.center.y = self.view.frame.midY + 200
        openingAnimations()
        progress.tintColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0)
        
        let delay1 = DispatchTime.now() + 1.04
        DispatchQueue.main.asyncAfter(deadline: delay1, execute: {self.runProgress()})
        let delay3 = DispatchTime.now() + 7
        DispatchQueue.main.asyncAfter(deadline: delay3, execute: {self.nextView()})
        let delay4 = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: delay4, execute: {self.bringInTheCheck()})
        
    }
    
}
