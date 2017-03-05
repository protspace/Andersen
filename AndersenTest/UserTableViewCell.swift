//
//  UserTableViewCell.swift
//  AndersenTest
//
//  Created by Ievgen Sagidulin on 3/5/17.
//  Copyright © 2017 Protspace. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension UserTableViewCell {
    
    func configure(title: String) {
        self.title.text = title
    }
    
}
