//
//  MainViewController.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 15/07/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Variables
    
    var viewModel = MainViewModel()
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Class Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func setupTableView() {
        self.title = "Main View"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCells()
    }
}

// MARK: - Extensions

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
