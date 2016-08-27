//
//  ViewController.swift
//  CustomSegue
//
//  Created by Bruno Paulino on 8/26/16.
//  Copyright © 2016 brunojppb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecongnizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.presentSecondView))
        swipeGestureRecongnizer.direction = .Left
        self.view.addGestureRecognizer(swipeGestureRecongnizer)
    }
    
    func presentSecondView() {
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.redColor()
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        }
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? {
        
        var segue: UIStoryboardSegue!
        if let id = identifier {
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: {
                })
                return unwindSegue
            }
        }
        segue = UIStoryboardSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        super.unwindForSegue(segue, towardsViewController: toViewController)
        return nil
    }


}

