//
//  ViewController.swift
//  sample
//
//  Created by Anderson Santos Gusmão on 02/12/2017.
//  Copyright © 2017 Anderson Santos Gusmão. All rights reserved.
//

import UIKit
import hkTransitus

class HomeViewController: SideMenuTransitionViewController<MenuViewController> {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func onDidTapSideMenu(id: Int, completionAnimation: (()-> Void)?) {
        super.onDidTapSideMenu(id: 0) {
            self.performSegue(withIdentifier: "goToNext", sender: nil)
        }
    }

    @IBAction func onTapButton(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SideMenuViewController") as! MenuViewController
        showSideMenu(viewController: vc)
    }
}

