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
        
        setup()
    }
    
    // MARK: - Setup -
    
    private func setup() {
        tableView.register(cellAndNibName: ItemTableViewCell.className)
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
