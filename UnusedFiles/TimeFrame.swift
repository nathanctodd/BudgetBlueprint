//
//  TimeFrame.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/14/21.
//

import Foundation
import UIKit

class TimeFrame: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dayCounter: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var dayCounts = 0
    var dateSelected = false
    let defaults = UserDefaults.standard
    var hasBeenChanged = false
    
    @IBAction func next(_ sender: UIButton) {
        
        let date = datePicker.date
        defaults.set(date, forKey: "date")
        let date2 = Date()
        defaults.set(date2, forKey: "startingDate")
        
        if (hasBeenChanged) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Advisement") as! Advisement
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Loading") as! Loading
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "FixedExpenses") as! FixedExpenses
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func datePickerDidUpdate(_ sender: Any) {
        if (dateSelected == false) {
            nextButtonAnimation()
            dateSelected = true
        }
        print("Editing did begin(): ")
        let date = datePicker.date
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        print(components)
        let days = components.day
        dayCounter.text = "Days: \(days!)"
        if (days! < 1) {
            nextButtonAnimationBack()
            dateSelected = false
        }
        
    }
    
    func nextButtonAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.nextButton.isEnabled = true
        }, completion: {
            finished in
        })
    }
    
    func nextButtonAnimationBack() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.nextButton.isEnabled = false
        }, completion: {
            finished in
        })
    }
    
    func openingAnimations() {
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
            self.titleLabel.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.18, options: .curveEaseInOut, animations: {
            self.descriptionLabel.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.36, options: .curveEaseInOut, animations: {
            self.datePicker.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.54, options: .curveEaseInOut, animations: {
            self.dayCounter.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.72, options: .curveEaseInOut, animations: {
            self.nextButton.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
        
    }
    
    override func viewDidLoad() {
        
        hasBeenChanged = defaults.bool(forKey: "hasBeenChanged")
        if (hasBeenChanged) {
            backButton.isHidden = true
            nextButton.setTitle("Confirm", for: .normal)
        }
        
        titleLabel.center.x = 0 - titleLabel.frame.width
        descriptionLabel.center.x = 0 - descriptionLabel.frame.width
        datePicker.center.x = 0 - datePicker.frame.width
        dayCounter.center.x = 0 - dayCounter.frame.width
        nextButton.center.x = 0 - nextButton.frame.width
        datePicker.preferredDatePickerStyle = .inline
        datePicker.contentHorizontalAlignment = .center
        datePicker.addTarget(self, action: #selector(datePickerDidUpdate(_:)), for: .editingChanged)
        datePicker.minimumDate = Date(timeIntervalSinceNow: 0)
        
        nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        nextButton.isEnabled = false
        
        let delay = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: delay, execute: {
            self.openingAnimations()
        })
        
    }
    
}
