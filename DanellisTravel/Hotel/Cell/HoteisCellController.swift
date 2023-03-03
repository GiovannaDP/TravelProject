//
//  HoteisCellController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 02/03/23.
//

import Foundation
import UIKit

protocol HoteisCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesViewModel?)
}

class HoteisCellController: UITableViewCell {
    
    private var customView: HoteisCellView = HoteisCellView()
    
    weak var delegate: HoteisCellControllerDelegate?

}

