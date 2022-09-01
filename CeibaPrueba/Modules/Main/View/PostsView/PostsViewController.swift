//
//  PostsViewController.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import UIKit

class PostsViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var lblNamePost: UILabel!
    @IBOutlet weak var lblPhonePost: UILabel!
    @IBOutlet weak var lblEmailPost: UILabel!
    @IBOutlet weak var btnExit: UIButton! {
        didSet {
            btnExit.layer.cornerRadius = 15
        }
    }
    
    let cellPosts = "cellPost"
    var userToPost: dataPosts?
    var postsData: [ResponsePosts]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureUI()
    }
    
    func configureUI() {
        
        lblNamePost.text = userToPost?.name
        lblPhonePost.text = userToPost?.phone
        lblEmailPost.text = userToPost?.email
        //Configure postsTableview
        self.postsTableView.delegate = self
        self.postsTableView.dataSource = self
        self.postsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.postsTableView.rowHeight = UITableView.automaticDimension
        self.postsTableView.estimatedRowHeight = 200
        self.postsTableView.register(UINib(nibName: "PostsTableViewCell", bundle: Bundle(for: PostsTableViewCell.self)), forCellReuseIdentifier: cellPosts)
    }
    
    @IBAction func actionExit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let postCell = tableView.dequeueReusableCell(withIdentifier: cellPosts, for: indexPath) as! PostsTableViewCell
        postCell.isUserInteractionEnabled = false
        guard let postsList = self.postsData?[indexPath.row] else { return postCell }
        postCell.configureCell(posts: postsList)
        return postCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let postList = self.postsData else { return 0 }
        return postList.count
    }
}
