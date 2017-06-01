//
//  FloatExtension.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import  UIKit

extension Float {
    var stringValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
