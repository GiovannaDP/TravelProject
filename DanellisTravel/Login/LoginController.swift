//
//  LoginController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 13/02/23.
//

import UIKit

class LoginController: UIViewController {
    
    private var customView: LoginView? = nil
    private var model: LoginModel? = nil
    private var userResponse: UserResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    func buildView() {
        view = LoginView()
        customView = view as? LoginView
        customView?.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }
    
    func checkTexts() -> Bool{
        if customView?.usernameText.text?.count == 11 || customView?.usernameText.text?.count == 14 {
            
            guard let numberPassword = customView?.passwordText.text?.count else { return false }
            return true

            }
        return false
    }
    
    func getData() {
        
        guard let secureTextField = customView?.passwordText, let text = secureTextField.text, let username = customView?.usernameText.text else { return }
            let unmaskedString = NSString(string: text)
        
        model = LoginModel(password: unmaskedString as String, username: username)
    }
    
    func navigateToApp(user: UserResponse) {
        if user.profileType == "CPF" {
            let pacotes = TelaInicialComprasController()
            self.navigationController?.pushViewController(pacotes, animated: true)
        } else {
            let telaInicialVendas = TelaInicialVendasController()
            self.navigationController?.pushViewController(telaInicialVendas, animated: true)
        }
    }
    
    @objc func login(_ sender: UIButton){
        if checkTexts() {
            
            getData()
            
            guard let model = model else { return }
            
            debugPrint("login")
            do {
                let service = LoginRequest()
                service.apiCall(model: model, callback: { result in
                    DispatchQueue.main.async { [self] in
                        switch result {
                        case let .failure(error):
                            print(error)
                        case let .success(data):
                            userResponse = data as! UserResponse
                            guard let user = userResponse else { return }
                            navigateToApp(user: user)
                            print(data, user.name)
                        }
                    }
                })
            }
        } else {
            debugPrint("ERRO")
        }
    }
    
    @objc func cadastro(_ sender: UIButton){
        debugPrint("cadastro")
        
        let vc = CadastroController()
        self.navigationController!.pushViewController(vc, animated: true)


    }
}
