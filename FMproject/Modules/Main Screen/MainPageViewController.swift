//
//  MainPageViewController.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

final class MainPageViewController: UIViewController {

    // MARK: - Outlets -
    
    // MARK: - Private properies -

    private let viewModel: MainPageViewModel
    
    // MARK: - Lifecycle -
    
    init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.data)
    }
    
    // MARK: - Setup -
}
