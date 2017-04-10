//
//  Mantle+RealmModel.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 07/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import Foundation
import Mantle

class MovieMantleRealmModel:MTLModel,MTLJSONSerializing {
    
    var movieId:NSNumber?
    var original_title:String?
    var overView:String?
    var genre_ids:[NSNumber]?
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]!{
        return [ "movieId": "id" , "original_title" : "original_title" ,"overView": "overview" ,"genre_ids" : "genre_ids" ]
    }
}


class MovieList:MTLModel,MTLJSONSerializing {
    
    var  movieList: [MovieMantleRealmModel]?
    var  total_pages : NSNumber?
    var  page : NSNumber?
    var  total_results:NSNumber?
    
    
    public static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]!{
        return [ "page" :"page", "total_results":"total_results" ,"total_pages":"total_pages","movieList":"results"]
    }
    
    static func movieListJSONTransformer() -> ValueTransformer! {
        return MTLJSONAdapter.arrayTransformer(withModelClass: MovieMantleRealmModel.self)
    }
    
}




