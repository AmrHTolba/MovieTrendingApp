//
//  MainViewCell.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 18/07/2023.
//

import UIKit
import SDWebImage

class MainViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainViewCell"
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Class Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCellUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellUI() {
        backView.addBorder(color: .label, width: 1)
        backView.round(10)
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainViewCell", bundle: nil)
    }
}
