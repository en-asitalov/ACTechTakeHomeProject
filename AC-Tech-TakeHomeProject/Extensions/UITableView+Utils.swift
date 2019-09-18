//
//  UITableView+Utils.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

extension UITableView {
    func register< T: UITableViewCell >(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register< T: UITableViewCell >(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.defaultNibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell< T: UITableViewCell >(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("No cell for deque identifier : \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
