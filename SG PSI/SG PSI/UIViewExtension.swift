//
//  UIViewExtension.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import Foundation

import UIKit

extension UIView {
    
    class func viewFromNib(name: String) -> UIView? {
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views?.first as? UIView
    }
}
