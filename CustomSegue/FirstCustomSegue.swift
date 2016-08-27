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
        
        // We want to slide left the new view and the old one to follow along
        // Place the next view at the right of the window
        secondVCView.frame = CGRectMake(screenWidth, 0, screenWidth, screenHeight)
        
        // get the window and insert the destination view above the current view
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        // Animate the transition
        // Moving the new view from the right to the left
        UIView.animateWithDuration(0.4, animations: {
            firstVCView.frame = CGRectOffset(firstVCView.frame, -screenWidth, 0)
            secondVCView.frame = CGRectOffset(secondVCView.frame, -screenWidth, 0)
            }) { (finished) in
                self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
        }
    }

}
