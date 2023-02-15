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
    private var model: CadastroModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: CadastroController())
        buildView()
    }
    
    func buildView() {
        view = CadastroView()
        customView = view as? CadastroView
        customView?.cadastroButton.addTarget(self, action: #selector(cadastro), for: .touchUpInside)
    }
    
    func getData() {
        guard let email = customView?.emailText.text, let name = customView?.nameText.text, let password = customView?.passwordText.text, let phone = customView?.phoneText.text, let username = customView?.usernameText.text else { return }
        model = CadastroModel(email: email, name: name, password: password, phone: phone, username: username)
    }
    
    func checkTexts() -> Bool{
        if customView?.usernameText.text?.count == 11 || customView?.usernameText.text?.count == 14 {
            if customView?.nameText.text != "" && customView?.passwordText.text != "" {
                if customView?.phoneText.text != "" || customView?.emailText.text != "" {
                    return true
                }
                return false
            }
            return false
        }
        return false
    }

    @objc func cadastro(_ sender: UIButton) {
        debugPrint("cadastrooo")
        if checkTexts() {
            self.getData()
            
            guard let model = model else { return }
            
            do {
                let service = CadastroRequest()
                service.apiCall(model: model, callback: { result in
                    DispatchQueue.main.async {
                        switch result {
                        case let .failure(error):
                            print(error)
                        case let .success(data):
                            print(data)
                        }
                    }
                })
            }
        } else {
            debugPrint("ERRO")
        }
    }
}
