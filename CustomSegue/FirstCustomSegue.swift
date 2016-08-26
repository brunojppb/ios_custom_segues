//
//  FirstCustomSegue.swift
//  CustomSegue
//
//  Created by Bruno Paulino on 8/26/16.
//  Copyright © 2016 brunojppb. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        let firstVCView = self.sourceViewController.view
        let secondVCView = self.destinationViewController.view
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // We want to slide up the new view and the old one to follow along
        // Place the next view at the bottom of the window
        secondVCView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        
        // get the window and insert the destination view above the current view
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        // Animate the transition
        UIView.animateWithDuration(0.4, animations: {
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, -screenHeight)
            }) { (finished) in
                self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
        }
    }

}
