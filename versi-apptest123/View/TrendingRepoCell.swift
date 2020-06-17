//
//  TrendingRepoCell.swift
//  versi-apptest123
//
//  Created by mohammed hassan on 6/14/20.
//  Copyright © 2020 mohammed hassan. All rights reserved.
//

import UIKit

class TrendingRepoCell: UITableViewCell {
    
    
    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescLbl: UILabel!
    @IBOutlet weak var numberOfForksLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var contributorsLbl: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var viewReadmeBtn: RoundedBorderButton!
    
    private var repoUrl: String?
    
    func configuareCell(repo : Repo) {
        repoImageView.image = repo.image
        repoNameLbl.text = repo.name
        repoDescLbl.text = repo.description
        numberOfForksLbl.text = String(repo.numberOfForks)
        languageLbl.text = repo.language
        contributorsLbl.text = String(repo.numberOfContributors)
        repoUrl = repo.repoUrl
    }
    
    override func layoutSubviews() {
        backView.layer.cornerRadius = 15
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backView.layer.shadowOpacity = 0.25
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
