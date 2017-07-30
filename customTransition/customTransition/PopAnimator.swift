//
//  PopAnimator.swift
//  customTransition
//
//  Created by admin on 30/07/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class PopAnimator: NSObject , UIViewControllerAnimatedTransitioning{
    
    var duration = 1.5
    var origanFrame = CGRect.zero
    var presenting  = true
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView  = transitionContext.view(forKey: .to)!
        let fromView = transitionContext.view(forKey: .from)!

        let currentView = presenting ? toView: fromView
        
        let initalFrame = presenting ? origanFrame : currentView.frame
        let finalFrame = presenting ? currentView.frame: origanFrame
        
        
        let xScalefactor = presenting ? 0.0 : finalFrame.width/initalFrame.width
        let yScalefactor = presenting ? 0.0 : finalFrame.height/initalFrame.height
        
        let scaleFactor = CGAffineTransform(scaleX: xScalefactor, y: yScalefactor)
        
        if presenting {
            
            currentView.transform = scaleFactor
            currentView.transform = CGAffineTransform.init(rotationAngle: 1.54)
            currentView.center =  CGPoint(x: initalFrame.midX, y: initalFrame.midY)


            
        }else{
            currentView.center =  CGPoint(x: initalFrame.midX, y: initalFrame.midY)
            currentView.transform = CGAffineTransform.init(rotationAngle: -1.54)

        }
        //    toView.center = fromView.center
        
        containerView.addSubview(toView)
        containerView.bringSubview(toFront: currentView)
       
        UIView.animate(
            
           withDuration: duration,
           delay: 0,
           usingSpringWithDamping: 0.25,
           initialSpringVelocity: 0.0,
           animations: {
                        
            currentView.transform = self.presenting ? .identity : scaleFactor
                  currentView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
                        
            },
           completion:{ (_) in
            
            transitionContext.completeTransition(true)
            print("completed")
        })
    }
    

}
