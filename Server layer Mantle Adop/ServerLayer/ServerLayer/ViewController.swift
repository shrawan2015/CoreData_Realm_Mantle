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
import  Realm

var downloadData = DownLoadViewModel()

class ViewController: UIViewController {
    
    func updateData(_ result: AnyObject) {
        //print(result)
        do {
            //Convert the dictionary into mapper model
            let movies = try MTLJSONAdapter.model(of: MovieList.self as AnyClass, fromJSONDictionary: result as! [AnyHashable : Any]) as! MovieList
            let obj = movies.movieList?[0]
            let gener_id = obj?.genre_ids
            print(gener_id )
            
            
            self.saveOfflineMovielist(moviList: movies)
            
        }catch  {
            print("Invalid Selection.")
        }

    }
    
    
    func saveOfflineMovielist(moviList :MovieList) {

        let realm:RLMRealm = RLMRealm.default()
        let movieRealm = MovieRealm()
        movieRealm.page = moviList.page as Int?
        
        //movieRealm.movieList = moviList.movieList
        realm.beginWriteTransaction()
        realm.add(movieRealm)
        
        do {
            try  realm.commitWriteTransaction()

        }catch  {
            print("Invalid Selection.")
        }
        
        //Load Back the data from realm
        let realmData = RLMRealm.default()
        let dataMovie:RLMResults = MovieRealm.allObjects(in: realmData)
        print(dataMovie)

    }
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData.initWithItems(updateData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}

