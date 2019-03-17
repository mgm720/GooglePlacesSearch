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

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var phoneTextView: UITextView!
    @IBOutlet weak var websiteTextView: UITextView!
    @IBOutlet weak var ratingsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDetail(for: selectedPlace)
        
        placeDetail.placeID = selectedPlace
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        detailView.layer.cornerRadius = 30
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
        placeDetail.rating = detail["rating"].stringValue
        placeDetail.userRatingsCount = detail["user_ratings_total"].stringValue
        
        updateUIWithPlaceDetail()
    }
    
    func updateUIWithPlaceDetail() {
        self.title = placeDetail.name
        
        addressTextView.text = placeDetail.address
        phoneTextView.text = "📞 " + placeDetail.phoneNumber!
        websiteTextView.text = placeDetail.website
        ratingsTextView.text = "\(placeDetail.rating!)⭐️ || \(placeDetail.userRatingsCount!) Ratings"
    }
    
}
