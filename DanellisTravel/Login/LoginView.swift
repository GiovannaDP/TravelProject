//
//  LoginView.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 13/02/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        setupView()
        configuraConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Travel"
        label.font = .systemFont(ofSize: 38.0, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    lazy var usernameText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.text = "Digite seu username"
        return text
    }()
    
    lazy var passwordText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.text = "Digite sua senha"
        return text
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var cadastroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Ainda não é cadastrado?"
        label.textColor = .white
        return label
    }()
    
    lazy var cadastroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fazer cadastro", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    func setupView() {
        addSubview(firstView)
        firstView.addSubview(titleLabel)
        firstView.addSubview(usernameText)
        firstView.addSubview(passwordText)
        firstView.addSubview(loginButton)
        firstView.addSubview(cadastroLabel)
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
            
            self.passwordText.topAnchor.constraint(equalTo: self.usernameText.topAnchor, constant: 40),
            self.passwordText.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.passwordText.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordText.topAnchor, constant: 60),
            self.loginButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            self.loginButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -20),
            
            self.cadastroLabel.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.cadastroLabel.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -50),
            
            self.cadastroButton.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor),
            self.cadastroButton.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -25)
            
            ])
            
        }
}
