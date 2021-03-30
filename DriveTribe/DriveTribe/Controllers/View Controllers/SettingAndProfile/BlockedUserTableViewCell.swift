//
//  BlockedUserTableViewCell.swift
//  DriveTribe
//
//  Created by Dennis High on 3/24/21.
//

import UIKit

protocol BlockedFriendTableViewCellDelegate: AnyObject {
    func unblockFriendButtonTapped(sender: BlockedUserTableViewCell)
}

class BlockedUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var unblockUserbutton: UIButton!
    
    var blockedUser: User? {
        didSet {
            updateView(blockedUser: blockedUser!)
        }
    }

    weak var delegate: BlockedFriendTableViewCellDelegate?
    
    @IBAction func unblockUserButton(_ sender: Any) {
        delegate?.unblockFriendButtonTapped(sender: self)    }
    
    func updateView(blockedUser: User) {
        userNameLabel.text = blockedUser.firstName
        unblockUserbutton.setTitle("UNBLOCK", for: .normal)
        profileImageView.setupRoundCircleViews()
        profileImageView.image = UIImage(systemName: "person")
        
    }
}
