//
//  ControllerTransitioningDelegate.swift
//  ActionController
//
//  Created by Kalluraya on 7/9/16.
//  Copyright © 2016 kvkalluraya. All rights reserved.
//

import UIKit

class ControllerTransitioningDelegate: NSObject , UIViewControllerTransitioningDelegate {

    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
