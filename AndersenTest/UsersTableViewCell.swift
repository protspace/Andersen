
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
    

}


extension UsersTableViewCell {
    
    func configure(userNamename: String?, companyName: String?) {
        self.name.text = userNamename ?? ""
        self.company.text = companyName ?? ""
    }
    
}
