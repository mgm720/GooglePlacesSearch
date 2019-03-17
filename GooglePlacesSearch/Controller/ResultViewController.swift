//
//  ResultViewController.swift
//  GooglePlacesSearch
//
//  Created by Michael Miles on 3/17/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResultViewController: UIViewController {
    
    var selectedPlace = ""
    let placeDetail = PlaceDetailDataModel()
    let apiFetcher = APIRequestFetcher()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDetail(for: selectedPlace)
        
        placeDetail.placeID = selectedPlace
    }

    func fetchDetail(for text: String) {
        print("ID searched: \(text)")
        accessDetail(placeID: text)
    }
    
    func updatePlaceDetail(json : JSON) {
        let detail = json["result"]
        placeDetail.name = detail["name"].stringValue
        placeDetail.address = detail["formatted_address"].stringValue
        placeDetail.phoneNumber = detail["formatted_phone_number"].stringValue
        placeDetail.website = detail["website"].stringValue
        placeDetail.rating = detail["rating"].floatValue
        placeDetail.userRatingsCount = detail["user_ratings_total"].intValue
        
        updateUIWithPlaceDetail()
    }
    
    func updateUIWithPlaceDetail() {
        
    }
    
}
