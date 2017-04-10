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
}
