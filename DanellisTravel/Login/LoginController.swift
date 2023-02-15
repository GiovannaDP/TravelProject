//
//  LoginController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 13/02/23.
//

import UIKit

class LoginController: UIViewController {
    
    private var customView: LoginView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    func buildView(){
        view = LoginView()
        customView = view as? LoginView
        customView?.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }
    
    @objc func login(_ sender: UIButton){
        debugPrint("login")
        let vc = CadastroController()
        
        present(vc, animated: true)
        
    }
    
    @objc func cadastro(_ sender: UIButton){
        debugPrint("cadastro")
        
        let vc = CadastroController()
        self.navigationController!.pushViewController(vc, animated: true)


    }
}
