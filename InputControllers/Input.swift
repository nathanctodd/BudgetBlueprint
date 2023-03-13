//
//  Home.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/2/21.
//

import Foundation
import UIKit

class Input: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var studentButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var workingButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func advance(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(person, forKey: "person")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Second") as! Second
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        
        let defaults = UserDefaults.standard
        defaults.set(person, forKey: "person")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Name") as! Name
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        
    }
    var person = -1
    
    @IBAction func studentTouch(_ sender: UIButton) {

        if studentButton.isSelected {
            studentButton.isSelected = false
            person = -1
        } else {
        studentButton.isSelected = true
            otherButton.isSelected = false
            workingButton.isSelected = false
            person = 0
        }
        
        updateButton()
        
    }
    @IBAction func workingTouch(_ sender: UIButton) {

        if workingButton.isSelected {
            workingButton.isSelected = false
            person = -1
        } else {
            workingButton.isSelected = true
            studentButton.isSelected = false
            otherButton.isSelected = false
            person = 1
            
        }
        
        updateButton()
        
    }
    @IBAction func otherTouch(_ sender: UIButton) {

        if otherButton.isSelected {
            otherButton.isSelected = false
            person = -1
        } else {
            workingButton.isSelected = false
            studentButton.isSelected = false
            otherButton.isSelected = true
            person = 2
        }
        
        updateButton()
        
    }
    
    func openingAnimations() {
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseInOut, animations: {
            self.label.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.18, options: .curveEaseInOut, animations: {
            self.studentButton.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.36, options: .curveEaseInOut, animations: {
            self.workingButton.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.54, options: .curveEaseInOut, animations: {
            self.otherButton.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        UIView.animate(withDuration: 0.7, delay: 0.72, options: .curveEaseInOut, animations: {
            self.nextButton.center.x = self.view.frame.midX
        }, completion: {
            finished in
        })
        
        
    }
    
    func unable(button: UIButton) {
        
        button.isEnabled = false;
        
    }
    
    
    func updateButton() {
        
        if person >= 0 {

            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }, completion: {
                finished in
            })
            
            UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseInOut, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }, completion: {
                finished in
            })
            
            UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
                self.nextButton.isEnabled = true;
            }, completion: {
                finished in
            })

        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }, completion: {
                finished in
            })
            
            let delayTime = DispatchTime.now() + 0.1
            DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                self.unable(button: self.nextButton)
            })
            
        }
        
    }
    
    
    func loadButtons() {
        
        switch person {
        case -1:
            studentButton.isSelected = false
            workingButton.isSelected = false
            otherButton.isSelected = false
        case 0:
            studentButton.isSelected = true
            workingButton.isSelected = false
            otherButton.isSelected = false
        case 1:
            studentButton.isSelected = false
            workingButton.isSelected = true
            otherButton.isSelected = false
        case 2:
            studentButton.isSelected = false
            workingButton.isSelected = false
            otherButton.isSelected = true
        default:
            studentButton.isSelected = false
            workingButton.isSelected = false
            otherButton.isSelected = false
        }
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        
        studentButton.center.x = 0 - studentButton.frame.width
        workingButton.center.x = 0 - workingButton.frame.width
        otherButton.center.x = 0 - otherButton.frame.width
        nextButton.center.x = 0 - nextButton.frame.width
        label.center.x = 0 - label.frame.width
        nextButton.isEnabled = false;
        
        let defaults = UserDefaults.standard
        person = defaults.integer(forKey: "person")
        loadButtons()
        updateButton()
        
        let delayTime = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.openingAnimations()
        })
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


