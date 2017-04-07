//
//  MovieRealm.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 07/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import Foundation

import Realm

class MovieRealm:RLMObject{
    
   // var  movieList: [RLMArray<RLMObject>]?
      var  total_pages  : Int? = nil
     var  page : Int? = nil
     var  total_results:Int? = nil
    
    override init() {
        super.init()
    }

    convenience init(movieList: MovieList) {
        self.init()

       // self.movieList = movieList.movieList as! [RLMArray<RLMObject>]?
        self.total_pages = movieList.total_pages as Int?
        self.page = movieList.page as Int?
        self.total_results =  movieList.total_results as Int?
    }
    
}
