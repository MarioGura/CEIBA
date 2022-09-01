//
//  UserTableViewCell.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var contentUser: UIView! {
        didSet {
            contentUser.layer.cornerRadius = 10
            contentUser.layer.shadowOffset = CGSize(width: 0, height: 3)
            contentUser.layer.shadowRadius = 1.5
            contentUser.layer.shadowOpacity = 0.2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(userData: ResponseUser) {
        
        lblName.text = userData.name
        lblEmail.text = userData.email
        lblPhone.text = userData.phone
    }
}
