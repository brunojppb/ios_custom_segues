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
        swipeGestureRecongnizer.direction = .Up
        self.view.addGestureRecognizer(swipeGestureRecongnizer)
    }
    
    func presentSecondView() {
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }


}

