//
//  DowloadService.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 06/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import Foundation
import SwiftyJSON

class DowloadService: HTTPClient {
    
    override func executeRequest(_ requestModel: AnyObject?) {
        requestURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=43dd8bb11c9abefef643794c5e0953d2"

        executeNetworkCall(
            { [unowned self] response in
                self.onHTTPSuccess(response)
            },
            failure: {
                self.onHTTPFailure()
        } )
    }
    
    func onHTTPSuccess(_ response: AnyObject) {
        onTaskSuccess(response)
    }
    
    func onHTTPFailure() {
        onTaskFailure()
    }
    
    func onTaskSuccess(_ model: AnyObject) {
        if((delegate) != nil) {
            delegate?.onTaskSuccess(model, networkTask: self)
        }
    }
    
    func onTaskFailure() {
        if((delegate) != nil) {
            delegate?.onTaskFailure(self)
        }
    }
}
