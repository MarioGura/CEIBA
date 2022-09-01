//
//  PostsTableViewCell.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitlePost: UILabel!
    @IBOutlet weak var lblTextPost: UILabel!
    @IBOutlet weak var contentPost: UIView! {
        didSet {
            contentPost.layer.cornerRadius = 10
            contentPost.layer.shadowOffset = CGSize(width: 0, height: 3)
            contentPost.layer.shadowRadius = 1.5
            contentPost.layer.shadowOpacity = 0.2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(posts: ResponsePosts) {
        
        lblTitlePost.text = "Titulo: \(posts.title)"
        lblTextPost.text = posts.body
    }
}
