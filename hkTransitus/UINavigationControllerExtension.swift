//
//  UINavigationControllerExtension.swift
//  hkTransitus
//
//  Created by Anderson Santos Gusmão on 02/12/2017.
//  Copyright © 2017 Anderson Santos Gusmão. All rights reserved.
//

import UIKit

extension UINavigationController {

    func roundCorners() {
        let path = UIBezierPath(roundedRect:(self.view.bounds), byRoundingCorners:[ .bottomRight, .topRight], cornerRadii: CGSize(width: 10, height:  10))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
    }

    func removeRoundedCorners() {
        let path = UIBezierPath(roundedRect:(self.view.bounds), byRoundingCorners:[], cornerRadii: CGSize(width: 0, height:  0))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
    }
}
