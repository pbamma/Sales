//
//  ContactsTableViewCell.swift
//  Sales
//
//  Created by Philip Starner on 1/3/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit
import Firebase

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageThumb.layer.cornerRadius = imageThumb.frame.size.height / 2
        imageThumb.layer.masksToBounds = true
        imageThumb.layer.borderWidth = 1
        imageThumb.layer.borderColor = Constants.COLOR_MAIN_TINT_2.cgColor
    }
    
    
    public func loadData(snapshot: DataSnapshot) {
        guard let contact = snapshot.value as? [String: String] else { return }
        let first = contact["first"] ?? ""
        let last = contact["last"] ?? ""
        self.nameLabel.text = first + " " + last
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
