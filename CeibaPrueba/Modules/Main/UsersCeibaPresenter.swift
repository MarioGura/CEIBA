//
//  UsersCeibaPresenter.swift
//  CeibaPrueba
//
//  Created JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Lottie

class UsersCeibaPresenter {
    weak private var view: UsersCeibaViewProtocol?
    var interactor: UsersCeibaInteractorInputProtocol?
    private let router: UsersCeibaWireframeProtocol
 
    init(interface: UsersCeibaViewProtocol, interactor: UsersCeibaInteractorInputProtocol?, router: UsersCeibaWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension UsersCeibaPresenter: UsersCeibaPresenterProtocol {
    func fetchUserData() {
        AnimationView.show(view: ((view as? UIViewController)?.view)!, color: UIColor.black.withAlphaComponent(0.6))
        interactor?.fetchPersistenceData()
    }
    
    func fetchUsers() {
        interactor?.fetchUsers()
    }
    
    func fetchPosts(id: Int) {
        AnimationView.show(view: ((view as? UIViewController)?.view)!, color: UIColor.black.withAlphaComponent(0.6))
        interactor?.fetchPosts(id: id)
    }
}

extension UsersCeibaPresenter: UsersCeibaInteractorOutputProtocol {
    func dataIsEmpty() {
        fetchUsers()
    }
    
    func dataPosts(posts: [ResponsePosts]) {
        view?.getPosts(posts: posts)
    }
    
    func dataUsers(users: [ResponseUser]) {
        view?.getUsers(users: users)
    }
    
    func dataSaved() {
        self.fetchUserData()
    }
    
    func returnNoInternet() {
        view?.noInternet()
    }
}
