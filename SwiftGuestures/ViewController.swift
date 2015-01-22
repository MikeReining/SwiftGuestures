//
//  ViewController.swift
//  SwiftGuestures
//
//  Created by Michael Reining on 1/22/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redSquare: UIView!

    @IBOutlet weak var yellowSquare: UIView!
    @IBOutlet weak var monkey: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Testing Coordinates
        var monkeyPosition = monkey.center
        var monkeyCenterPoint = monkey.center
        var redSquarePosition = redSquare.center
        var redSquareFrame = redSquare.frame
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        let position = recognizer.locationInView(self.view)
        recognizer.view!.center = CGPoint(x:recognizer.view!.center.x + translation.x,
            y:recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, inView: self.view)
        var monkeyPosition = monkey.center
        
        let yellowFrame = yellowSquare.frame
        let yellowFrameInSuperView = self.view.convertRect(yellowSquare.frame, fromView: redSquare)
        
        if yellowFrameInSuperView.contains(monkey.center) {
            
            println("Monkey is home")
            recognizer.enabled = false
            let message = "Thanks for bringing the monkey home!"
            let alert = UIAlertController(title: "Monkey is home!", message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "This was fun!", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }

    }
    
}

