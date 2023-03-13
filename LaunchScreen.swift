//
//  LaunchScreen.swift
//  newDevelopment
//
//  Created by Nathan Todd on 12/9/21.
//

import Foundation
import UIKit

class LaunchScreen: UIViewController {
    
    @IBOutlet weak var airplane: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    func flyAndSend() {
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseIn, animations: {
            self.airplane.center.x = self.view.frame.maxX + self.airplane.frame.width
            self.airplane.center.y = self.view.frame.minY
        }, completion: {
            finished in
        })
        
        let delayTime = DispatchTime.now() + 1.2
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.next()
        })
        
        
    }
    
    func next() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "OpeningController") as! OpeningController
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        label.center.x = self.view.frame.midX - 30
        airplane.center.x = self.view.frame.midX + 20
        label2.center.x = self.view.frame.midX

        let delayTime = DispatchTime.now() + 0.8
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.flyAndSend()
        })
        
    }
    
    
}
