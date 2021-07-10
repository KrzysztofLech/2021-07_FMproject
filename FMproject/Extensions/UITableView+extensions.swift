//
//  UITableView+extensions.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

extension UITableView {
    func register(cellAndNibName name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
}
