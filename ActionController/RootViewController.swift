//
//  RootViewController.swift
//  ActionController
//
//  Created by  Kalluraya on 7/9/16.
//  Copyright © 2016  kvkalluraya. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var transitionDelegate:ControllerTransitioningDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        transitionDelegate = ControllerTransitioningDelegate()
        destinationViewController.transitioningDelegate = transitionDelegate

    }

}

