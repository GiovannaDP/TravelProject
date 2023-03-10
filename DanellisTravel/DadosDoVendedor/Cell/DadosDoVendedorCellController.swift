//
//  DadosDoVendedorCellController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 09/03/23.
//

import Foundation
import UIKit

protocol DadosDoVendedorCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesViewModel?)
}


class DadosDoVendedorCellController: UITableViewCell {
    
    private var customView: DadosDoVendedorCell = DadosDoVendedorCell()
    
    weak var delegate: DadosDoVendedorCellControllerDelegate?

}
