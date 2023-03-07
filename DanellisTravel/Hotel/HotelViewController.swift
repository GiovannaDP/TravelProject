//
//  HotelViewController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 05/03/23.
//

import Foundation
import UIKit

class HotelViewController: UIViewController {
    
    var hotel: HotelViewModel.hotel?
    
    class func instanciar(_ viagem: HotelViewModel.hotel) -> HotelViewController {
        let hotelViewController = HotelViewController()
        hotelViewController.hotel = viagem
        
        return hotelViewController
    }
    
    private var customView: HotelView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        configuraView()
        
    }
    
    func buildView() {
        view = HotelView()
        customView = view as? HotelView
    }
    
    func configuraView() {
        
        guard let price = hotel?.precoDiaria, let nota = hotel?.nota, let nome = hotel?.nome, let local = hotel?.local else { return }
        let notaString: String

        customView?.titleLabel.text = "\(nome) - \(local)"
        customView?.departureDateLabel.text = hotel?.dataChegada
        customView?.returnDateLabel.text = hotel?.dataSaida
        customView?.precoLabel.text = "R$ \(price)"
        
        if nota == 0 {
            notaString = "Sem avaliações"
            customView?.notaLabel.text = notaString
        } else {
            customView?.notaLabel.text = "Nota: \(hotel?.nota)"
        }
    }
}
