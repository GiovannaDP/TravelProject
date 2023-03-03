//
//  VooViewController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 23/02/23.
//

import Foundation
import UIKit

class VooViewController: UIViewController {
    
    private var customView: VooView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        api()
        
    }
    
    func buildView() {
        view = VooView()
        customView = view as? VooView
    }
    
    func api(){
        do {
            let service = VoosRequest()
            service.apiCall(callback: { result in
                DispatchQueue.main.async { [self] in
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

