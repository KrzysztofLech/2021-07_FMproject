//
//  SplashScreenViewController.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

final class SplashScreenViewController: UIViewController {

    @IBOutlet private var titleView: UIView!
    @IBOutlet private var downloadingInfoView: UIView!
    
    private weak var delegate: RootCoordinatorDelegate?
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol, delegate: RootCoordinatorDelegate) {
        self.dataService = dataService
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchData()
    }
    
    private func fetchData() {
        dataService.getData { [weak self] success in
            self?.downloadingInfoView.isHidden = true
            
            DispatchQueue.main.async {
                if success {
                    self?.closeController()
                } else {
                    self?.showAlert()
                }
            }
        }
    }
    
    private func closeController() {
        UIView.animate(withDuration: 1) {
            self.titleView.alpha = 0
        } completion: { _ in
            self.delegate?.hideSplashScreen()
        }
    }
    
    private func showAlert() {
        delegate?.showAlert(withMessage: "Data dwonloading problem!", errorHandler: { [weak self] in
            self?.downloadingInfoView.isHidden = false
            self?.fetchData()
        })
    }
}
