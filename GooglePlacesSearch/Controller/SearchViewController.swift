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
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        searchTextField.delegate = self
        
        resultsTableView.isHidden = true
    }
    
    //MARK: TextField methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        searchTextFieldTopConstraint.constant = 10
        tableViewTopConstraint.constant = 65
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        self.searchLabel.isHidden = true
        self.resultsTableView.isHidden = false
        
        textField.addTarget(self, action: #selector(SearchViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print(searchTextField.text ?? "no text")
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

