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
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension UserTableViewCell {
    
    func configureTitle(_ title: String) {
        self.title.text = title
    }
    
    func configureAvatar(url: URL?) {
        guard let avatarUrl = url else {return}
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: avatarUrl)
            DispatchQueue.main.async {
                self.avatar.image = UIImage(data: data!)
            }
        }
        
    }
    
}
