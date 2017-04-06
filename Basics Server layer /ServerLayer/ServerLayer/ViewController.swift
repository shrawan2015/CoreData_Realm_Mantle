//
//  ViewController.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 06/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias DataConfigureBlocks = (Bool) -> Void
var downloadData = DownLoadViewModel()

class ViewController: UIViewController {

    func updateData(_ isSuccess: Bool) {
        if(isSuccess == true) {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData.initWithItems(updateData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}

