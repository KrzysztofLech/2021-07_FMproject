//
//  WebPageViewController.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

final class WebPageViewController: UIViewController {

    // MARK: - Private properies -
    
    private let pageUrl: String
    
    // MARK: - Lifecycle -
    
    init(pageUrl: String) {
        self.pageUrl = pageUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setup -
    
    private func setup() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .gray
        title = String(pageUrl.components(separatedBy: "//").last?.dropLast() ?? "")
    }
}
