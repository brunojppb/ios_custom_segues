//
//  FistCustomSegueUnwind.swift
//  CustomSegue
//
//  Created by Bruno Paulino on 8/26/16.
//  Copyright © 2016 brunojppb. All rights reserved.
//

import UIKit

class FirstCustomSegueUnwind: UIStoryboardSegue {
    
    override func perform() {
        // notice the the SecondView now is the source view
        // We are putting back the FirstViewController
        // So 
        let secondVCView = self.sourceViewController.view
        let firstVCView = self.destinationViewController.view
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, screenWidth, 0.0)
            secondVCView.frame = CGRectOffset(secondVCView.frame, screenWidth, 0.0)
            
        }) { (Finished) -> Void in
            
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }

}
