//
//  TelaInicialComprasController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 15/02/23.
//

import Foundation
import UIKit

class TelaInicialComprasController: UIViewController, PacotesCellControllerDelegate {
    func didSelectView(_ viagem: Viagem?) {
        //
    }
    private var customView: TelaInicialComprasView? = nil
    private var button: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraTableView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    func getInfo() {
        
    }
    
    func buildView() {
        view = TelaInicialComprasView()
        customView = view as? TelaInicialComprasView
        customView?.buttonPacotes.addTarget(self, action: #selector(pacotes), for: .touchUpInside)
        customView?.buttonVoos.addTarget(self, action: #selector(voos), for: .touchUpInside)
        customView?.buttonHoteis.addTarget(self, action: #selector(hoteis), for: .touchUpInside)
    }
    
    func configuraTableView() {
        customView?.tableView.register(PacotesCellView.self, forCellReuseIdentifier: "PacotesCellView")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
    
    @objc func pacotes(_ sender: UIButton) {
        button = "pacotes"
        checkButton()
        debugPrint(button)
        
    }
    
    @objc func voos(_ sender: UIButton) {
        button = "voos"
        checkButton()
        
        debugPrint(button)
    }
    
    @objc func hoteis(_ sender: UIButton) {
        button = "hoteis"
        checkButton()
        debugPrint(button)
        
    }
    
    func checkButton() {
        guard let button = button else { return }
        if button == "pacotes" {
            customView?.buttonPacotes.isSelected = true
            customView?.buttonVoos.isSelected = false
            customView?.buttonHoteis.isSelected = false
        } else if button == "voos" {
            customView?.buttonVoos.isSelected = true
            customView?.buttonPacotes.isSelected = false
            customView?.buttonHoteis.isSelected = false
            
            do {
                let service = VoosRequest()
                service.apiCall(callback: { result in
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
            customView?.buttonHoteis.isSelected = true
            customView?.buttonVoos.isSelected = false
            customView?.buttonPacotes.isSelected = false
            
            do {
                let service = HoteisRequest()
                service.apiCall(callback: { result in
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
        }
    }
    
    func irParaDetalhes(_ viagem: Viagem?) {
//        if let viagemSelecionada = viagem {
//            let detalheController = DetalheViewController.instanciar(viagemSelecionada)
//            navigationController?.pushViewController(detalheController, animated: true)
//        }
    }
}

extension PacotesController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return secaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secaoDeViagens?[section].viagens.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = secaoDeViagens?[indexPath.section]
        
        
        switch viewModel?.tipo {
        case .pacotes:
        
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "PacotesCellView", for: indexPath) as? PacotesCellView else {
                fatalError("error to create ViagemTableViewCell")
            }
            
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])

            return celulaViagem
            
        default:
            return UITableViewCell()
        }
    }
}

extension PacotesController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let viewModel = secaoDeViagens?[indexPath.section]
//        
//        switch viewModel?.tipo {
//        case .pacotes:
//            let viagemSelecionada = viewModel?.viagens[indexPath.row]
//            irParaDetalhes(viagemSelecionada)
//        default: break
//        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
//    }
}

//extension PacotesController: OfertaTableViewCellDelegate {
//    func didSelectView(_ viagem: Viagem?) {
//        irParaDetalhes(viagem)
//    }
//}
