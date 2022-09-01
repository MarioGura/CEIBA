//
//  UsersCeibaViewController.swift
//  CeibaPrueba
//
//  Created JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Lottie

class UsersCeibaViewController: UIViewController, UsersCeibaViewProtocol {
	var presenter: UsersCeibaPresenterProtocol?

    @IBOutlet weak var searcrBar: UISearchBar!
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var viewListEmpty: UIView!
    
    let cellUser = "myTemplate"
    var usersData: [ResponseUser]?
    var postsData: [ResponsePosts] = []
    var userToPost: dataPosts?
    let persistenceClient = UserPersistenceUserDefault()
    let dispatch = DispatchQueue.main

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchUserData()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userTableView?.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
     
    }
    
    func configureUI() {
        self.searcrBar.delegate = self
        self.viewListEmpty.isHidden = true
        hideKeyboardWhenTappedAround()
        self.userTableView?.delegate = self
        self.userTableView?.dataSource = self
        self.userTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.userTableView?.rowHeight = UITableView.automaticDimension
        self.userTableView?.estimatedRowHeight = 200
        self.userTableView?.register(UINib(nibName: "UserTableViewCell", bundle: Bundle(for: UserTableViewCell.self)), forCellReuseIdentifier: cellUser)
    }
    
    func openPosts() {
        AnimationView.hide()
        let postsView = PostsViewController(nibName: "PostsViewController", bundle: nil)
        postsView.userToPost = self.userToPost
        postsView.postsData = self.postsData
        postsView.modalPresentationStyle = .overFullScreen
        present(postsView, animated: true, completion: nil)
    }
    
// Presenter to view
    func getUsers(users: [ResponseUser]) {
        self.usersData = users
        self.userTableView?.reloadData()
        dispatch.asyncAfter(deadline: .now() + 0.5) {
            AnimationView.hide()
        }
    }
    
    func getPosts(posts: [ResponsePosts]) {
        self.postsData = posts
        openPosts()
    }
    
    func noInternet() {
        AnimationView.hide()
        showAlert(title: "¡Error de conexión!", message: "Se requiere una conexion a internet para visualizar las publicaciones, favor de validar su conexión")
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension UsersCeibaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let userData = self.usersData else { return 0 }
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellUser, for: indexPath) as! UserTableViewCell
        guard let userList = self.usersData?[indexPath.row] else { return cell}
        cell.configureCell(userData: userList)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let listUser = self.usersData else { return }
        let userSelected = listUser[indexPath.row].id
        let data = dataPosts(name: listUser[indexPath.row].name,
                             phone: listUser[indexPath.row].phone,
                             email: listUser[indexPath.row].email)
        userToPost = data
        presenter?.fetchPosts(id: userSelected)
    }
}

//MARK: UISearchBarDelegate
extension UsersCeibaViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let userPersistence = persistenceClient.getUsers()

        guard !searchText.isEmpty else {
            usersData = userPersistence
            userTableView.reloadData()
            return
       }

        let filterUser = userPersistence.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        usersData = filterUser
        userTableView.reloadData()
        
        if usersData!.isEmpty {
            viewListEmpty.isHidden = false
        } else {
            viewListEmpty.isHidden = true
        }
    
    }
}

