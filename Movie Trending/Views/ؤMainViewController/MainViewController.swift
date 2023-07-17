//
//  MainViewController.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 15/07/2023.
//

import UIKit

class MainViewController: UIViewController {
    
// MARK: - IBoutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.title = "Main View"
        
        setupTableView()
    }

    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}



// MARK: - Extensions


extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        
    }
}
