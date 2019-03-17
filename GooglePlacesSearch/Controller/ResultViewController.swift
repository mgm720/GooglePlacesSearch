//
//  ResultViewController.swift
//  GooglePlacesSearch
//
//  Created by Michael Miles on 3/17/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var selectedPlace = ""
    let placeDetail = PlaceDetailDataModel()
    let apiFetcher = APIRequestFetcher()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDetail(for: selectedPlace)
    }

    func fetchDetail(for text: String) {
        print("ID searched: \(text)")
        apiFetcher.accessDetail(placeID: text)
    }
}
