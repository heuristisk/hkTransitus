//
//  MenuViewController.swift
//  sample
//
//  Created by Anderson Santos Gusmão on 02/12/2017.
//  Copyright © 2017 Anderson Santos Gusmão. All rights reserved.
//

import UIKit
import hkTransitus

class MenuViewController: UIViewController, SideMenuInteraction, UITableViewDataSource, UITableViewDelegate {

    private var options: [Int: String] = [0 : "Option one",1 : "Option two",2 : "Option three", 3 : "Option four"]
    var delegate: SideMenuInteractionDelegation?
    @IBOutlet weak var header: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleTap))
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        header.addGestureRecognizer(tap)
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        delegate?.goBackHome()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onDidTapSideMenu(id: indexPath.row, completionAnimation: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuUITableViewCell", for: indexPath) as? MenuUITableViewCell

        cell?.lblDescription.text = options[indexPath.row] ?? String()

        return cell ?? UITableViewCell()
    }
}
