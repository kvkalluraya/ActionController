 //
//  CustomPresentationController.swift
//  ActionController
//
//  Created by  Kalluraya on 7/9/16.
//  Copyright © 2016 kvkalluraya. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {


    var backgroundView:UIView!
    
    
    override func shouldPresentInFullscreen() -> Bool {
        return true
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        
        var fullFrame = self.presentedView()?.frame
        fullFrame?.origin.y = 0.75 * (fullFrame?.size.height)!
        fullFrame?.size.height *= 0.25
        return fullFrame!
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSizeMake(parentSize.width,parentSize.height*0.25)
    }
    
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        //Lets add a light background to dim the background
        backgroundView = UIView(frame: presentingViewController.view.frame)
        backgroundView.backgroundColor = UIColor.blackColor()
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self.presentedViewController, action: #selector(ActionViewController.close)))

        self.containerView?.addSubview(backgroundView)
        
        backgroundView.alpha = 0
        
        let transitionCoordinator = self.presentedViewController.transitionCoordinator()
        transitionCoordinator?.animateAlongsideTransition({ (context:UIViewControllerTransitionCoordinatorContext) in
            
                self.backgroundView.alpha = 0.4

            }, completion: { (context:UIViewControllerTransitionCoordinatorContext) in
                
        })
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        if false == completed {
            backgroundView.removeFromSuperview()
        }
    }
    
    
    override func dismissalTransitionWillBegin() {
        
        let transitionCoordinator = self.presentedViewController.transitionCoordinator()
        transitionCoordinator?.animateAlongsideTransition({ (context:UIViewControllerTransitionCoordinatorContext) in
            
            self.backgroundView.alpha = 0
            
            }, completion: { (context:UIViewControllerTransitionCoordinatorContext) in
                
        })
    }
    
    
}

