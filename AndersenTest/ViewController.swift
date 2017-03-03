//
//  ViewController.swift
//  AndersenTest
//
//  Created by Eugen Sagidulin on 3/3/17.
//  Copyright © 2017 Protspace. All rights reserved.
//

import UIKit

let kUsersCellIdentifier = "kUsersCellIdentifier"


class ViewController: UIViewController {

    var viewModel = ViewModel()
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: kUsersCellIdentifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUsers()
        tableView.reloadData()
    }

}


extension ViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kUsersCellIdentifier, for: indexPath as IndexPath) as! UsersTableViewCell
        let user = viewModel.users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

