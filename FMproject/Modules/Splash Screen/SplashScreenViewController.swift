//
//  SplashScreenViewController.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

final class SplashScreenViewController: UIViewController {

    // MARK: - Outlets -
    
    @IBOutlet private var titleView: UIView!
    @IBOutlet private var downloadingInfoView: UIView!
    
    // MARK: - Private properties -
    
    private weak var delegate: RootCoordinatorDelegate?
    private let dataService: DataServiceProtocol
    
    // MARK: - Lifecycle -
    
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
    
    // MARK: - Data -
    
    private func fetchData() {
        dataService.fetchData { [weak self] response in
            DispatchQueue.main.async {
                self?.downloadingInfoView.isHidden = true
                
                switch response {
                case .success:
                    self?.closeController()
                case .failure(let error):
                    self?.showAlert(message: error.rawValue)
                }
            }
        }
    }
    
    // MARK: - Actions -
    
    private func closeController() {
        UIView.animate(withDuration: 1) {
            self.titleView.alpha = 0
        } completion: { _ in
            self.delegate?.hideSplashScreen()
        }
    }
    
    private func showAlert(message: String) {
        delegate?.showAlert(
            title: "Data dwonloading problem!",
            message: message,
            errorHandler: { [weak self] in
                self?.downloadingInfoView.isHidden = false
                self?.fetchData()
            })
    }
}
