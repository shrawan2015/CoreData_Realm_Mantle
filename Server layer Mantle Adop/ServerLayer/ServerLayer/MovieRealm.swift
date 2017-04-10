//
//  MovieRealm.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 07/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import Foundation
import RealmSwift

class MovieRealm:Object{

    //var  movieList: [RLMArray<RLMObject>]?
    dynamic var total_pages: Double = 0.0
    dynamic var total_results: Double = 0.0
    dynamic var page: Double = 0.0
    //var moviedisplay = List<MovieListRealm>()

    
    
    override public static func primaryKey() -> String? {
        return "total_pages"
    }
    
    convenience init(moviList:MovieList) {
        self.init()
        page = moviList.page as! Double
        total_pages = moviList.total_pages as! Double
    }
    
}


class MovieListRealm:Object {
    
   // var genre_ids:[NSNumber]?
    
    dynamic var movieId: Double = 0.0
    dynamic var original_title: String = ""
    dynamic var overView: String = ""

}

