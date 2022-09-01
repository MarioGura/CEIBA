//
//  UsersCeibaProtocols.swift
//  CeibaPrueba
//
//  Created JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter -> Router
protocol UsersCeibaWireframeProtocol: AnyObject {
    
}

//MARK: View -> Presenter
protocol UsersCeibaPresenterProtocol: AnyObject {
    var interactor: UsersCeibaInteractorInputProtocol? { get set }
    
    func fetchUserData()
    func fetchUsers()
    func fetchPosts(id: Int)
}

//MARK: Interactor -> Presenter
protocol UsersCeibaInteractorOutputProtocol: AnyObject {
    
    func dataIsEmpty()
    func dataUsers(users: [ResponseUser])
    func dataPosts(posts: [ResponsePosts])
    func dataSaved()
    func returnNoInternet()
}

//MARK: Presenter -> Interactor
protocol UsersCeibaInteractorInputProtocol: AnyObject {
    var presenter: UsersCeibaInteractorOutputProtocol?  { get set }
    
    func fetchPersistenceData()
    func fetchUsers()
    func fetchPosts(id: Int)
}

//MARK: Presenter -> View
protocol UsersCeibaViewProtocol: AnyObject {
    var presenter: UsersCeibaPresenterProtocol?  { get set }
    
    func getUsers(users: [ResponseUser])
    func getPosts(posts: [ResponsePosts])
    func noInternet()
}
