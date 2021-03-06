//
//  DownLoadViewModel.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 06/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias DataConfigureBlocks = (AnyObject) -> Void

class DownLoadViewModel: NetworktaskDelegate {

    var getData = DowloadService()
    var block : DataConfigureBlocks!
    
    func initWithItems(_ completion: @escaping DataConfigureBlocks) {
        block = completion
        getData.delegate = self
        downLoadData()
    }
    
    func downLoadData() {
            getData.executeRequest(nil);
    }
    
    func onTaskSuccess(_ response: AnyObject, networkTask: AnyObject) {
        DispatchQueue.main.async(execute: {
            self.block(response)
            
        })
    }
    
    func onTaskFailure(_ networkTask: AnyObject) {
        DispatchQueue.main.async(execute: {
            self.block("false" as AnyObject)
        })
    }
}
