
//
//  ViewController.swift
//  AndersenTest
//
//  Created by Eugen Sagidulin on 3/3/17.
//  Copyright © 2017 Protspace. All rights reserved.
//



import UIKit


class UsersTableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var company: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configure(user: User) {
        self.name.text = user.name
        self.company.text = user.company
    }

}
