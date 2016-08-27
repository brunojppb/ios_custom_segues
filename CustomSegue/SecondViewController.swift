//
//  SecongViewController.swift
//  CustomSegue
//
//  Created by Bruno Paulino on 8/26/16.
//  Copyright © 2016 brunojppb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeGestureRecongnizer = UISwipeGestureRecognizer(target: self, action: #selector(SecondViewController.showFirstViewController))
        swipeGestureRecongnizer.direction = .Right
        self.view.addGestureRecognizer(swipeGestureRecongnizer)
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
    }


}
