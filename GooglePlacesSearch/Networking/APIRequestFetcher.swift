//
//  APIRequestFetcher.swift
//  GooglePlacesSearch
//
//  Created by Michael Miles on 3/17/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

enum NetworkError: Error {
    case failed
    case success
}

class APIRequestFetcher {
    var searchResults = [JSON]()
    
    let googleAPI = "AIzaSyANAB2qpcDlxNOy74FD_n1UfaTOl6SD0QA"
    let sessionID = String(Int.random(in: 0...99999999))
    
    func search(searchText: String, completionHandler: @escaping ([JSON]?, NetworkError) -> ()) {
        let googleURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(searchText)&sessiontoken=\(sessionID)&key=\(googleAPI)"
        
        Alamofire.request(googleURL).responseJSON { (response) in
            guard let data = response.data else {
                completionHandler(nil, .failed)
                return
            }
            
            let json = try? JSON(data: data)
            let results = json?["predictions"].arrayValue
            guard let empty = results?.isEmpty, !empty else {
                completionHandler(nil, .failed)
                return
            }
            
            completionHandler(results, .success)
            print(results ?? "no results")
        }
    }
}
