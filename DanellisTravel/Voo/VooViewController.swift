//
//  VooViewController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 23/02/23.
//

import Foundation
import UIKit

class VooViewController: UIViewController {
    
    var voo: VooViewModel.Voo?
    
    class func instanciar(_ viagem: VooViewModel.Voo) -> VooViewController {
        let vooViewController = VooViewController()
        vooViewController.voo = viagem
        
        return vooViewController
    }
    
    private var customView: VooView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraView()
        
    }
    
    func buildView() {
        view = VooView()
        customView = view as? VooView
    }
    
    func configuraView() {
        
        guard let vagas = voo?.vacancies, let price = voo?.price, let name = voo?.name else { return }
        customView?.titleLabel.text = name
        customView?.imageView.image = UIImage(named: voo?.images[0].image ?? "Londres-1")
        customView?.tituloVooLabel.text = voo?.destiny
        customView?.origemLabel.text = voo?.origin
        customView?.departureDateLabel.text = voo?.departureDate
        customView?.returnDateLabel.text = voo?.returnDate
        customView?.vagasRestantesLabel.text = "Vagas restantes: \(vagas)"
        customView?.precoLabel.text = "R$\(price)"
        customView?.classeLabel.text = voo?.classType
    }
}

