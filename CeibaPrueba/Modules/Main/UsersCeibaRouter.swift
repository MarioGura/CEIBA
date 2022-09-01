//
//  UsersCeibaRouter.swift
//  CeibaPrueba
//
//  Created JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class UsersCeibaRouter: UsersCeibaWireframeProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = UsersCeibaViewController(nibName: "UsersCeibaViewController", bundle: nil)
        let interactor = UsersCeibaInteractor()
        let router = UsersCeibaRouter()
        let presenter = UsersCeibaPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
