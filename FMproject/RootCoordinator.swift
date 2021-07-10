//
//  RootCoordinator.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

protocol Coordinator {
    func start()
}

protocol RootCoordinatorDelegate: AnyObject {
    func hideSplashScreen()
    func showAlert(withMessage message: String, errorHandler: @escaping () -> ())
}

final class RootCoordinator: NSObject, Coordinator {
    
    // MARK: - Properties -
    
    private var window: UIWindow?
    private var splashScreenViewController: SplashScreenViewController?
    
    private let dataService: DataServiceProtocol
        
    // MARK: - Init -
    
    init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
        self.dataService = DataService()
    }
    
    // MARK: - Module Methods -
    
    func start() {
        showSplashScreen()
    }
    
    private func showSplashScreen() {
        splashScreenViewController = SplashScreenViewController(
            dataService: dataService,
            delegate: self)
        window?.rootViewController = splashScreenViewController
        window?.makeKeyAndVisible()
    }
    
    private func showMainScreen() {
        let mainViewController = MainViewController()
        window?.rootViewController = mainViewController
    }
}

// MARK: - Root Coordinator delegate methods -

extension RootCoordinator: RootCoordinatorDelegate {
    func hideSplashScreen() {
        showMainScreen()
    }
    
    func showAlert(withMessage message: String, errorHandler: @escaping () -> ()) {
        let errorAction = UIAlertAction(
            title: "Try again",
            style: .default) { _ in
            errorHandler()
        }
        
        let alerController = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert)
        
        alerController.addAction(errorAction)
        splashScreenViewController?.present(alerController, animated: true)
    }
}
