//
//  CadastroController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 13/02/23.
//

import Foundation
import UIKit

class CadastroController: UIViewController {
    
    private var customView: CadastroView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: CadastroController())
        view.backgroundColor = .purple
        buildView()
    }
    
    func buildView(){
        view = CadastroView()
        customView = view as? CadastroView
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }

    @objc func cadastro(_ sender: UIButton){
        debugPrint("cadastro")
    }
}
