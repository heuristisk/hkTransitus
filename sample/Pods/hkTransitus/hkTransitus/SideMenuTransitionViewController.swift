//
//  TransitionViewController.swift
//  hkTransitus
//
//  Created by Anderson Santos Gusmão on 01/12/2017.
//  Copyright © 2017 Anderson Santos Gusmão. All rights reserved.
//

import UIKit

public protocol SideMenuInteractionDelegation: class {
    func onDidTapSideMenu(id: Int, completionAnimation: (()-> Void)?)
    func goBackHome()
}

public protocol SideMenuInteraction: class {
    weak var delegate: SideMenuInteractionDelegation? { get set }
}

public extension SideMenuInteractionDelegation {
    func goBackHome() { }
}

open class SideMenuTransitionViewController<T: UIViewController & SideMenuInteraction>: UIViewController, SideMenuInteractionDelegation {
    private let TAG = 1
    private var width: CGFloat!
    private var originalTransform: CGAffineTransform?
    weak var delegate: SideMenuInteractionDelegation?
    private var vc: T?

    override open func viewDidLoad() {
        super.viewDidLoad()
        width = self.view.bounds.width
        UIApplication.shared.keyWindow?.backgroundColor = #colorLiteral(red: 0.1612666561, green: 0.1612666561, blue: 0.1612666561, alpha: 1)
    }

    open func goBackHome() {
        hideSideMenu {}
    }

    open func onDidTapSideMenu(id: Int, completionAnimation: (()-> Void)?) {
        hideSideMenu {
            completionAnimation?()
        }
    }

    open func showSideMenu(viewController: T) {

        vc = viewController
        vc?.delegate = self
        if originalTransform == nil {
            originalTransform = self.navigationController!.view.transform
        }

        let scaledTransform = originalTransform?.scaledBy(x: 0.8, y: 0.8)
        let scaledAndTranslatedTransform = scaledTransform?.translatedBy(x: (width*0.8) * -1, y: 0)

        UIApplication.shared.keyWindow?.rootViewController?.addChildViewController(viewController)
        viewController.view.tag = TAG
        viewController.view.frame.origin.x = width
        UIApplication.shared.keyWindow?.addSubview(viewController.view)

        UIView.animate(withDuration: 0.3, animations: { viewController.view.frame.origin.x = 0 })
        self.navigationController?.roundCorners()

        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.5, options: .curveEaseInOut, animations: {
            self.navigationController?.view.transform = scaledAndTranslatedTransform!
        }, completion: nil)
    }

    private func hideSideMenu(completionAnimation: (()-> Void)?) {

        UIApplication.shared.keyWindow?.viewWithTag(TAG)?.removeFromSuperview()
        self.navigationController?.removeRoundedCorners()
        UIView.animate(withDuration: 0.1, animations: { self.vc?.view.frame.origin.x = self.width
        }) { (isFinished) in self.vc?.removeFromParentViewController() }

        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.5, options: .curveEaseInOut, animations: {
            self.navigationController?.view.transform = self.originalTransform!
        }, completion: { (isFinished) in
            completionAnimation?()
        })
    }
}
