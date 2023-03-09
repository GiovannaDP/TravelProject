//
//  DadosDoUsuarioViewController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 07/03/23.
//

import Foundation
import UIKit

class DadosDoUsuarioViewController: UIViewController {
    
    private var customView: DadosDoUsuarioView? = nil
    private var celulas: [DadosDoUsuarioCell]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraTableView()
    }
    
    func buildView() {
        view = DadosDoUsuarioView()
        customView = view as? DadosDoUsuarioView
    }
    
    func configuraTableView() {
        customView?.tableView.register(DadosDoUsuarioCell.self, forCellReuseIdentifier: "DadosDoUsuarioCell")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
}

extension DadosDoUsuarioViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "DadosDoUsuarioCell", for: indexPath) as? DadosDoUsuarioCell else {
            fatalError("error to create ViagemTableViewCell")
        }

        switch indexPath.row {
        case 0:
            celula.configuraInfo(icon: "folder.badge.person.crop", info: "Seus dados")
        case 1:
            celula.configuraInfo(icon: "star.circle", info: "Seus favoritos")
        case 2:
            celula.configuraInfo(icon: "bag.circle", info: "Suas compras")
        case 3:
            celula.configuraInfo(icon: "return.left", info: "Sair")
        default:
            break
        }
        
        return celula
        
    }
}

extension DadosDoUsuarioViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
