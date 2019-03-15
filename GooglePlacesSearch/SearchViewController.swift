//
//  ViewController.swift
//  GooglePlacesSearch
//
//  Created by Michael Miles on 3/14/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchInsetView: UIView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var searchTextFieldTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        searchTextField.delegate = self
        
        resultsTableView.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        searchTextFieldTopConstraint.constant = 10
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        self.searchLabel.isHidden = true
        self.resultsTableView.isHidden = false
    }
    
    func setupUI() {
        searchTextField.leftView = searchInsetView
        searchTextField.leftViewMode = .always
    }
    
    //MARK: TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        return cell
    }


}

