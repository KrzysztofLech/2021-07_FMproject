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
    func showAlert(title: String, message: String, errorHandler: @escaping () -> ())
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
        let mainPageViewModel = MainPageViewModel(dataService: dataService)
        let mainPageViewController = MainPageViewController(viewModel: mainPageViewModel)
        window?.rootViewController = mainPageViewController
    }
}

// MARK: - Root Coordinator delegate methods -

extension RootCoordinator: RootCoordinatorDelegate {
    func hideSplashScreen() {
        showMainScreen()
        splashScreenViewController = nil
    }
    
    func showAlert(title: String, message: String, errorHandler: @escaping () -> ()) {
        let errorAction = UIAlertAction(
            title: "Try again",
            style: .default) { _ in
            errorHandler()
        }
        
        let alerController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alerController.addAction(errorAction)
        splashScreenViewController?.present(alerController, animated: true)
    }
}
