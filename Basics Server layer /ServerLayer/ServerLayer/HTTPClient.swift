//
//  HTTPClient.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 06/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import SwiftyJSON

enum NetworkTaskResponses: Int {
    case success = 0
    case apiFailure
    case serverRequestFailure
    case internetUnavailability
}


protocol NetworktaskDelegate {
    
    func onTaskSuccess(_ response: JSON, networkTask: AnyObject)
    func onTaskFailure(_ networkTask: AnyObject)
    
}


class HTTPClient:NSObject {
    
    var baseURL:String
    var requestURL:String
    var errorMessage:String
    var networkTaskresponse:NetworkTaskResponse
    var delegate: NetworktaskDelegate?
    

    override init() {
        baseURL = "https://google.com/"
        requestURL = "https://api.themoviedb.org/3/movie/888?api_key=43dd8bb11c9abefef643794c5e0953d2"
        errorMessage = ""
        networkTaskresponse = NetworkTaskResponse.success
    }
    
    
    func executeNetworkCall(_ success: @escaping (_ response: AnyObject) -> Void, failure: @escaping () -> Void ) {
        executeNetworkTask(success, failure: failure )
    }
    
    func executeRequest(_ requestModel: AnyObject?) {
    }

    func executeNetworkTask(_ success: @escaping (_ response: AnyObject) -> Void, failure: @escaping () -> Void ) {
        
        let urlString = requestURL

        networkTaskresponse = NetworkTaskResponse.success

        
        Alamofire.request(
            urlString)
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    self.networkTaskresponse = NetworkTaskResponse.serverRequestFailure
                        failure()
                        return
                }
               
                if let value = response.result.value {
                    success(value as AnyObject)
                }
                else {
                    failure()
                }
        }
    }
}
