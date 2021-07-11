//
//  MainPageViewController.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

final class MainPageViewController: UIViewController {

    // MARK: - Outlets -
    
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private properies -

    private let viewModel: MainPageViewModel
    private weak var delegate: RootCoordinatorDelegate?
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle -
    
    init(viewModel: MainPageViewModel, delegate: RootCoordinatorDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addRefreshControl()
    }
    
    // MARK: - Setup -
    
    private func setup() {
        title = "Data list"
        navigationItem.backButtonDisplayMode = .minimal
        
        tableView.register(cellAndNibName: ItemTableViewCell.className)
        tableView.contentInset.top = 16
    }
    
    // MARK: - Refreshing data -
    
    private func addRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)

        let refreshControlTitle = "Data downloading ..."
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        refreshControl.attributedTitle = NSAttributedString(string: refreshControlTitle, attributes: attributes)
        
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshControlAction() {
        refreshData()
    }
    
    private func refreshData() {
        tableView.isUserInteractionEnabled = false
        tableView.alpha = 0.4
        
        viewModel.fetchData { [weak self] in
            self?.refreshControl.endRefreshing()
            self?.tableView.reloadData()
            self?.tableView.isUserInteractionEnabled = true
            self?.tableView.alpha = 1.0
        }
    }
}

// MARK: - TableView Data Source -

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.className, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        cell.configure(withData: viewModel.data[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate -

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pageUrl = viewModel.data[indexPath.row].pageUrl
        delegate?.didTapOnItem(withUrl: pageUrl)
    }
}
