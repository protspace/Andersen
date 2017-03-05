//
//  UsersViewController.swift
//  AndersenTest
//
//  Created by Eugen Sagidulin on 3/3/17.
//  Copyright © 2017 Protspace. All rights reserved.
//

import UIKit

let kUsersCellIdentifier = "kUsersCellIdentifier"
let kToUserSegueIdentifier = "kToUserSegueIdentifier"


class UsersViewController: UIViewController {

    var viewModel = ViewModel()
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: kUsersCellIdentifier)
            tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadUsers()
        tableView.reloadData()
    }
    

}


extension UsersViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kToUserSegueIdentifier {
            let userProfile = segue.destination as? UserViewController
            userProfile?.viewModel = viewModel
        }
    }
}


extension UsersViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kUsersCellIdentifier, for: indexPath as IndexPath) as! UsersTableViewCell
        let user = viewModel.users[indexPath.row]
        cell.configure(userNamename: viewModel.userNameFor(user: user), companyName: viewModel.companyNameFor(user: user))
        return cell
    }

    
}

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.currentUser = viewModel.users[indexPath.row]
        guard viewModel.currentUser != nil else {return}
        performSegue(withIdentifier: kToUserSegueIdentifier, sender: self)
    }
}



