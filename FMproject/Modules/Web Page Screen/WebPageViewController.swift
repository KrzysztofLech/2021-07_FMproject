//
//  WebPageViewController.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit
import WebKit

final class WebPageViewController: UIViewController {

    // MARK: - Private properties -
    
    private let pageUrl: String
    private weak var delegate: RootCoordinatorDelegate?
    private let contentView = WebPageView()
    
    // MARK: - Lifecycle -
        
    init(pageUrl: String, delegate: RootCoordinatorDelegate) {
        self.pageUrl = pageUrl
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        loadPage()
    }
        
    // MARK: - Setup -
    
    private func setup() {
        navigationController?.navigationBar.tintColor = .gray
        title = String(pageUrl.components(separatedBy: "//").last?.dropLast() ?? "")
        contentView.webView.navigationDelegate = self
    }
    
    // MARK: - Web link methods -
    
    private func loadPage() {
        guard let url = URL(string: pageUrl) else { return }
        
        let request = URLRequest(url: url)
        contentView.webView.load(request)
    }
}

extension WebPageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        contentView.isPageDownloading = false
    }
        
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        contentView.isPageDownloading = false
        delegate?.showAlert(
            title: "Page downloading problem!",
            message: "Please select another page",
            errorHandler: { [weak self] in
                self?.delegate?.hideWebPage()
            })
    }
}
