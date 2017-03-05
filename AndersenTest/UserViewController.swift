//
//  UserViewController.swift
//  AndersenTest
//
//  Created by Ievgen Sagidulin on 3/5/17.
//  Copyright © 2017 Protspace. All rights reserved.
//

let kUserCellIdentifier = "kUserCellIdentifier"


import UIKit


class UserViewController: UIViewController {

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: kUserCellIdentifier)
            tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }

    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

extension UserViewController {
    
    fileprivate func setTitle() {
        guard let user = viewModel.currentUser else {return}
        title = viewModel.userNameFor(user: user)
    }
    
}
extension UserViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kUserCellIdentifier, for: indexPath as IndexPath) as! UserTableViewCell
        switch indexPath.row {
        case 0:
            cell.configureAvatar(url: viewModel.profileAvatarFor(user: viewModel.users[indexPath.row]))
        default:
            cell.configureTitle(viewModel.profileTitleFor(row: indexPath.row))
        }
        return cell
    }
    
}



