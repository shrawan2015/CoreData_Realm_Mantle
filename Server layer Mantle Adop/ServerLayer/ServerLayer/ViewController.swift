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
import  RealmSwift

var downloadData = DownLoadViewModel()

class ViewController: UIViewController {
    
    func updateData(_ result: AnyObject) {

        do {
            //Convert the dictionary into mapper model
            let movies = try MTLJSONAdapter.model(of: MovieList.self as AnyClass, fromJSONDictionary: result as! [AnyHashable : Any]) as! MovieList
            let obj = movies.movieList?[0]
            let gener_id = obj?.genre_ids
            print(gener_id ?? "error" )
            self.saveOfflineMovielist(moviList: movies)
        }catch  {
            print("Invalid Selection.")
        }

    }
    
    
    func saveOfflineMovielist(moviList :MovieList) {

        //Save the data in realm
        do {
            let realm = try Realm()
            try realm.write {
                let movieRealm = MovieRealm(moviList: moviList)
                realm.add(movieRealm)
            }
        } catch {
            print("Error!")
        }
        
        
        //Retrive all the data from the realm
        do {
            let realm = try Realm()
            let movieList = realm.objects(MovieRealm.self)
            print(movieList)
        } catch {
            print("Error!")
        }
        
   
        //Retrive particular data from the Realm
        do {
            let realm = try Realm()
            let result = realm.objects(MovieListRealm.self).filter("movieId < 200")

            print(result)
        } catch {
            print("Error!")
        }
        
        
        /*
         let realm = try! Realm()
         let result = realm.objects(Publication).filter("ANY typez.text = 'special'")
         print(result)
         */

    }
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData.initWithItems(updateData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}

