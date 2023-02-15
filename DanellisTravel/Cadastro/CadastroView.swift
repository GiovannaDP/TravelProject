//
//  CadastroView.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 13/02/23.
//

import Foundation
import UIKit

class CadastroView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        
        setupView()
        configuraConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Cadastro"
        label.font = .systemFont(ofSize: 38.0, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    lazy var emailText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.text = "Digite seu email"
        return text
    }()
    
    lazy var nameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.text = "Digite seu nome"
        return text
    }()
    
    lazy var passwordText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.text = "Digite sua senha"
        return text
    }()
    
    lazy var phoneText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.text = "Digite seu telefone"
        return text
    }()
    
    lazy var usernameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.text = "Digite seu CPF ou CNPJ"
        return text
    }()
    
    lazy var cadastroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(usernameText)
        firstView.addSubview(emailText)
        firstView.addSubview(nameText)
        firstView.addSubview(phoneText)
        firstView.addSubview(passwordText)
        firstView.addSubview(cadastroButton)
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            
            self.usernameText.topAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: 100),
            self.usernameText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.usernameText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.nameText.topAnchor.constraint(equalTo: self.usernameText.topAnchor, constant: 40),
            self.nameText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.nameText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.emailText.topAnchor.constraint(equalTo: self.nameText.topAnchor, constant: 40),
            self.emailText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.emailText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.phoneText.topAnchor.constraint(equalTo: self.emailText.topAnchor, constant: 40),
            self.phoneText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.phoneText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.passwordText.topAnchor.constraint(equalTo: self.phoneText.topAnchor, constant: 40),
            self.passwordText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.passwordText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.cadastroButton.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.cadastroButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -25)
            
            ])
            
        }
}
