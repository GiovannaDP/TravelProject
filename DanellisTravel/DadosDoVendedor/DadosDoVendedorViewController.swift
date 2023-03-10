//
//  DadosDoVendedorViewController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 09/03/23.
//

import Foundation
import UIKit

class DadosDoVendedorViewController: UIViewController {
    
    private var customView: DadosDoVendedorView? = nil
    private var celulas: [DadosDoVendedorCell]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraTableView()
    }
    
    func buildView() {
        view = DadosDoVendedorView()
        customView = view as? DadosDoVendedorView
    }
    
    func configuraTableView() {
        customView?.tableView.register(DadosDoVendedorCell.self, forCellReuseIdentifier: "DadosDoVendedorCell")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
}

extension DadosDoVendedorViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            
        guard let celula = tableView.dequeueReusableCell(withIdentifier: "DadosDoVendedorCell", for: indexPath) as? DadosDoVendedorCell else {
            fatalError("error to create ViagemTableViewCell")
        }

        switch indexPath.row {
        case 0:
            celula.configuraInfo(icon: "folder.badge.person.crop", info: "Seus dados")
        case 1:
            celula.configuraInfo(icon: "star.circle", info: "Seus anuncios")
        case 2:
            celula.configuraInfo(icon: "bag.circle", info: "Suas vendas")
        case 3:
            celula.configuraInfo(icon: "message.circle", info: "Suas mensagens")
        case 4:
            celula.configuraInfo(icon: "return.left", info: "Sair")
        default:
            break
        }
        
        return celula
        
    }
}

extension DadosDoVendedorViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
