//
//  ViewController.swift
//  GooglePlacesSearch
//
//  Created by Michael Miles on 3/14/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchInsetView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        searchTextField.leftView = searchInsetView
        searchTextField.leftViewMode = .always
    }


}

