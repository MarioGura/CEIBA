//
//  ViewController+Extension.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let accionClose = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
        alertController.addAction(accionClose)
        self.present(alertController, animated: true, completion: nil)
    }
}
