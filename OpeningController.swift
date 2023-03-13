//
//  openingController.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/2/21.
//

import UIKit

class OpeningController: UIViewController {
    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slogan: UILabel!
    let lightBlur = UIBlurEffect(style: UIBlurEffect.Style.dark)
    let blurView = UIVisualEffectView()
    var nameInput = false
    
    @IBAction func buttonTouch(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            
            self.blurView.alpha = 1
            
        }, completion: {
            finished in
        })
        
       presentView()
        
    }
    
    
    func presentView() {
        
        nameInput = UserDefaults.standard.bool(forKey: "nameInput")
        if (nameInput == true) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeHub") as! HomeHub
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Name") as! Name
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.modalTransitionStyle = .crossDissolve
            self.present(newViewController, animated: true, completion: nil)
        }
        
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print(background.center.x, background.center.y, background.frame.width, background.frame.height)
        
    }
    
    
    func openingAnimations() {
        
        UIView.animate(withDuration: 1, delay: 0.9, options: .curveEaseInOut, animations: {
            self.NextButton.center.y = self.view.frame.midY + self.view.frame.height * 0.25
        }, completion: {
            finished in
              print("Opening Animations Complete")
        })
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut, animations: {
            self.background.center.y = self.view.frame.height * 0.25
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 1, delay: 0.1, options: .curveEaseInOut, animations: {
            self.titleLabel.center.y = self.view.frame.midY
        
            self.slogan.center.y = self.view.frame.midY + 150
        }, completion: {
            finished in
        })
        
        UIView.animate(withDuration: 1, delay: 1.7, options: .curveEaseInOut, animations: {
            self.slogan.alpha = 1
        }, completion: {
            finished in
        })
        
        
        
        
        blurView.effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurView.frame = self.background.bounds
        blurView.frame.size.height = self.background.frame.height * 1.25
        blurView.center = self.background.center
        blurView.alpha = 0;
        //self.background.addSubview(blurView)

    }
    
    
    override func viewDidLoad() {

        
        NextButton.center.y = self.view.frame.height + NextButton.frame.height
        background.center.y = 0 - background.frame.height
        titleLabel.center.y = 0 - titleLabel.frame.height
        
        NextButton.center.x = self.view.frame.midX
        background.center.x = self.view.frame.midX
        titleLabel.center.x = self.view.frame.midX
        slogan.center.x = self.view.frame.midX
        
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "hasBeenChanged")

        slogan.alpha = 0
        
        let delayTime = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.openingAnimations()
        })
        
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

