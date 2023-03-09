//
//  UIViewController+Extension.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 09/03/23.
//

import Foundation
import UIKit

extension UIViewController {
    func navigateToMenu() {
        let vc = DadosDoUsuarioViewController()
        vc.modalTransitionStyle = .flipHorizontal
        navigationController?.present(vc, animated: true)
    }
}

