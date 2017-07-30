//
//  ViewController.swift
//  customTransition
//
//  Created by admin on 30/07/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let customTransition = PopAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }


    @objc func handleTap(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "secound")
            vc?.transitioningDelegate = self
        
        self.present(vc!, animated: true, completion: nil)
    }
}

extension ViewController:UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        customTransition.origanFrame = view.frame
        customTransition.presenting = true
        
        return customTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        customTransition.presenting = false

        return customTransition
    }
    
}






















