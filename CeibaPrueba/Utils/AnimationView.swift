//
//  Lottie.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import Foundation
import UIKit
import Lottie

class AnimationView {
    
    static var labelView = UIView()
    static var label = UILabel()
    
    static func show(view: UIView, color: UIColor) {
        
        label.text = "Buscando en la base de datos..."
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Avenir-Black", size: 18)
        label.numberOfLines = 0
        label.sizeToFit()
        
        labelView.backgroundColor = color
        
        view.addSubview(labelView)
        labelView.addSubview(label)
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: view.topAnchor),
            labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 40.0),
            label.trailingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: -40.0),
        ])
    }
    
    public static func hide() {
        label.removeFromSuperview()
        labelView.removeFromSuperview()
    }
}

