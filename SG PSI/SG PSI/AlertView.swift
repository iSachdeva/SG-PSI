//
//  AlertView.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import Foundation
import Foundation
import UIKit

typealias AlertCompletetionHandler = (Int,String)->()

class Alert {
    
    var alert:UIAlertController?
    var title = ""
    var message = ""
    init() {
        
    }
    
    convenience init(title:String,message:String) {
        self.init()
        
        self.alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func show(withButtons buttons:[String:UIAlertActionStyle]!,completetionHandler:@escaping AlertCompletetionHandler) {
        
        var actions = [UIAlertAction]()
        
        for aButton in buttons {
            
            if aButton.key.characters.count > 0 {
                let action = UIAlertAction(title: aButton.key, style: aButton.value, handler: {
                    (alert:UIAlertAction) in
                    
                    if let index = actions.index(of: alert) {
                        let result = actions[index]
                        actions = []
                        completetionHandler(index,result.title!)
                    }
                })
                
                actions.append(action)
                if let alert = self.alert,actions.count>0 {
                    alert.addAction(action)
                }
            }
        }
        
        if let alert = self.alert {
            DispatchQueue.main.async {
                if let alert = Alert.checkIfAnyAlertViewOnScreen() {
                    alert.present(alert, animated: true, completion: nil)
                } else {
                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    public static func checkIfAnyAlertViewOnScreen() -> UIAlertController? {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            if topController is UIAlertController {
                return (topController as! UIAlertController)
            } else {
                return nil
            }
        }
        return nil
    }
}
