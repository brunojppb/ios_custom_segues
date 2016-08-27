//
//  SecondCustomSegue.swift
//  CustomSegue
//
//  Created by Bruno Paulino on 8/26/16.
//  Copyright © 2016 brunojppb. All rights reserved.
//

import UIKit

class SecondCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        let firstVCView = self.sourceViewController.view
        let thirdVCView = self.destinationViewController.view
        
        // Add view to window
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(thirdVCView, belowSubview: firstVCView)
        
        // Scale down the destination view
        thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
        
        // Animate the transition
        UIView.animateWithDuration(0.5, animations: {
            // animate the source view to scale down
            firstVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
            
            }) { (finished) in
                // We animate again to scale the destination view up
                UIView.animateWithDuration(0.5, animations: {
                    // Scale up the destination view
                    thirdVCView.transform = CGAffineTransformIdentity
                    }, completion: { (finished) in
                        firstVCView.transform = CGAffineTransformIdentity
                        self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
                })
        }
        
        
    }

}
