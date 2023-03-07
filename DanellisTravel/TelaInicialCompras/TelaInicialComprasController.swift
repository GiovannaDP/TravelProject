//
//  TelaInicialComprasController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 15/02/23.
//

import Foundation
import UIKit

class TelaInicialComprasController: UIViewController{
    

    private var customView: TelaInicialComprasView? = nil
    private var button: String? = nil
    private var pacotesModel: [PacotesViewModel.pacote?] = []
    private var voosModel: [VooViewModel.Voo?] = []
    private var hoteisModel: [HotelViewModel.hotel?] = []
    
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
        customView?.tableView.register(VoosCellView.self, forCellReuseIdentifier: "VoosCellView")
        customView?.tableView.register(HoteisCellView.self, forCellReuseIdentifier: "HoteisCellView")
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
    }
    
    @objc func pacotes(_ sender: UIButton) {
        button = "pacotes"
        checkButton()
    }
    
    @objc func voos(_ sender: UIButton) {
        button = "voos"
        checkButton()
    }
    
    @objc func hoteis(_ sender: UIButton) {
        button = "hoteis"
        checkButton()
    }
    
    func checkButton() {
        guard let button = button else { return }
        if button == "pacotes" {
            customView?.buttonPacotes.isSelected = true
            customView?.buttonVoos.isSelected = false
            customView?.buttonHoteis.isSelected = false
            
            do {
                let service = PacotesRequest()
                service.apiCall(callback: { result in
                    DispatchQueue.main.async {
                        switch result {
                        case let .failure(error):
                            print(error)
                        case let .success(data):
                            self.pacotesModel = data as? [PacotesViewModel.pacote] ?? []
                            print(self.pacotesModel)
                        }
                    }
                })
            }
            
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
                            self.voosModel = data as? [VooViewModel.Voo] ?? []
                            print(self.voosModel)
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
                            self.hoteisModel = data as? [HotelViewModel.hotel] ?? []
                            print(self.hoteisModel)
                        }
                    }
                })
            }
        }
        customView?.tableView.reloadData()
    }
    
    func irParaDetalhesVoo(_ viagem: VooViewModel.Voo?) {
        if let viagemSelecionada = viagem {
            let vooController = VooViewController.instanciar(viagemSelecionada)
            navigationController?.pushViewController(vooController, animated: true)
        }
    }
    
    func irParaDetalhesHotel(_ viagem: HotelViewModel.hotel?) {
        if let viagemSelecionada = viagem {
            let hotelController = HotelViewController.instanciar(viagemSelecionada)
            navigationController?.pushViewController(hotelController, animated: true)
        }
    }
}

extension TelaInicialComprasController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch button {
        case "voos":
            return voosModel.count
        case "pacotes":
            return pacotesModel.count
        case "hoteis":
            return hoteisModel.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 350 : 475
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if button == "voos" {
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "VoosCellView", for: indexPath) as? VoosCellView else {
               fatalError("error to create ViagemTableViewCell")
           }
            
            if voosModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagem.configuraCelula(voosModel[indexPath.row])
                return celulaViagem
            }
            
            
        } else if button == "pacotes" {
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "VoosCellView", for: indexPath) as? VoosCellView else {
                fatalError("error to create ViagemTableViewCell")
            }
            
            return UITableViewCell()
            
            
        } else {
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "HoteisCellView", for: indexPath) as? HoteisCellView else {
               fatalError("error to create ViagemTableViewCell")
           }
            if hoteisModel.isEmpty {
                return UITableViewCell()
            } else {
                celulaViagem.configuraCelula(hoteisModel[indexPath.row])
                return celulaViagem
            }
        }
    }
}

extension TelaInicialComprasController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch button {
        case "voos":
            let viewModel = voosModel[indexPath.row]
            irParaDetalhesVoo(viewModel)
        case "hoteis":
            let viewModel = hoteisModel[indexPath.row]
            irParaDetalhesHotel(viewModel)
        default:
            debugPrint("outros")
        }
        
    }
    
}
