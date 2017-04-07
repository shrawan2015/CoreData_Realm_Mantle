//
//  ViewController.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 06/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import UIKit
import SwiftyJSON
import  Mantle

var downloadData = DownLoadViewModel()

class ViewController: UIViewController {

    //model(of modelClass: Swift.AnyClass!, fromJSONDictionary JSONDictionary: [AnyHashable : Any]!) throws -> Any
    

    //ArticleListResponseModel *list = [MTLJSONAdapter modelOfClass:ArticleListResponseModel.class
    //fromJSONDictionary:responseDictionary error:&error];
    
    func updateData(_ result: JSON) {
       // print(result)
//        do {
//        let user = try MTLJSONAdapter.model(of: MovieList.self as AnyClass, fromJSONDictionary: result as! [AnyHashable : Any])
//        }catch  {
//            print("Invalid Selection.")
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData.initWithItems(updateData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}

