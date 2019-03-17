//
//  APIRequestFetcher.swift
//  GooglePlacesSearch
//
//  Created by Michael Miles on 3/17/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//
// used the following article for reference on API search: https://medium.com/@MuraliKathir/build-a-simple-api-search-with-alamofire-and-swiftyjson-80286e833315

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
        let originalURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(searchText)&sessiontoken=\(sessionID)&key=\(googleAPI)"
        
        // learned about this feature here https://stackoverflow.com/questions/3439853/replace-occurrences-of-space-in-url
        let googleURL : String = originalURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
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
        }
    }
    
    func accessDetail(placeID: String) {
        let googleURL = "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeID)&fields=name,formatted_address,formatted_phone_number,rating,user_ratings_total,website&key=\(googleAPI)"
        
        Alamofire.request(googleURL, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                print(JSON(response.result.value!))
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }

}
