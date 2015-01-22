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

    @IBOutlet weak var monkey: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Testing Coordinates
        var monkeyPosition = monkey.center
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
        
        if redSquare.frame.contains(monkeyPosition) {
            println("Monkey is home")
        }

    }
    
}

