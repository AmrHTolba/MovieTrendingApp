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
    var cellDataSource: [Movie] = []
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Fetch data when the view appears
        viewModel.getData()
    }
    
    // Set up the table view by configuring its delegate, data source, and registering cells
    func setupTableView() {
        self.title = "Main View"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Register table view cells
        registerCells()
        
        // Bind isLoading property of viewModel to update the activity indicator
        bindIsLoading()
        
        // Bind cellDataSource property of viewModel to update the table view
        bindCellDataSource()
    }
    
    // Bind the isLoading property of viewModel to update the activity indicator based on its value
    func bindIsLoading() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    // Bind the cellDataSource property of viewModel to update the table view's data source and reload the table view
    func bindCellDataSource() {
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
}

// MARK: - Extensions

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movieData = cellDataSource[indexPath.row]
        cell.textLabel?.text = self.viewModel.getMovieTitle(movieData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    // Register table view cells
    func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // Reload the table view on the main queue
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
