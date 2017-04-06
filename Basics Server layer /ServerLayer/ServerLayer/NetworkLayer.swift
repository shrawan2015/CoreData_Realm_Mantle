//
//  NetworkLayer.swift
//  ServerLayer
//
//  Created by ShrawanKumar Sharma on 06/04/17.
//  Copyright © 2017 com.ServerLayer. All rights reserved.
//

import Foundation

enum NetworkTaskResponse: Int {
    case success = 0
    case apiFailure
    case serverRequestFailure
    case internetUnavailability
}
