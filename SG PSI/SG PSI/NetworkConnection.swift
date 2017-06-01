//
//  NetworkConnection.swift
//  SG PSI
//
//  Created by Amit Sachdeva on 1/6/17.
//  Copyright © 2017 Amit Sachdeva. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

enum NetworkRequestType {
    case psiIndex
}

class NetworkConnection {
    
    static var shared = NetworkConnection()
    
    init() {
        
    }
    
    var header:[String:String] {
        get {
            return ["api-key" : Constant.PrivateKey.restAPI]
        }
    }
    
    func getPSIIndex(time:String,completetioHandler:@escaping (Bool,PSIResponse?,Error?)->()) {
        
        let url = Constant.URL.baseUrl + Constant.URL.psi
        let postParameters = ["date_time":time]
        
        Alamofire.request(url, method: .get, parameters: postParameters, encoding: URLEncoding.default, headers: self.header).responseObject { (response:DataResponse<PSIResponse>) in
            
            switch(response.result) {
            case .success(_):
                if let psiResponse = response.result.value {
                    DispatchQueue.main.async {
                        completetioHandler(true,psiResponse,nil)
                    }
                }
                break
                
            case .failure(_):
                DispatchQueue.main.async {
                    completetioHandler(false,response.result.value,response.error)
                }
                break
            }
        }
    }
}