//
//  FileListViewController.swift
//  IxigoAssignment
//
//  Created by Manisha Sharma on 28/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import UIKit

class FileListViewController: UIViewController {
    @IBOutlet var listView: UITableView!

    @IBOutlet weak var sortByTakeOffButton: UIButton!
    @IBOutlet weak var sortByContainerView: UIView!
    
    @IBOutlet weak var sortByPriceButton: UIButton!
    @IBOutlet weak var sortByLandingButton: UIButton!
    
    @IBOutlet weak var sortByButton: UIButton!

    @IBOutlet weak var headerTitkleLabel: UILabel!
    
    @IBAction func sortByPriceTapped(_ sender: Any) {
        viewModel.sortByPriceTapped()
    }
    
    @IBAction func sortByTakeOffTapped(_ sender: Any) {
        viewModel.sortBytakeOffTapped()
    }
    
    @IBAction func sortByLandingTapped(_ sender: Any) {
        viewModel.sortByLandingTapped()
    }

    @IBAction func showSortByContainer(_ sender: Any) {
        if sortByContainerView.isHidden {
            sortByContainerView.isHidden = false
        } else {
            sortByContainerView.isHidden = true
        }
    }

    private var viewModel = FlightListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchFileListData()
        viewModel.delegate = self
        sortByContainerView.isHidden = true
        
        // to hide sort by continer view on tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        sortByContainerView.addGestureRecognizer(tap)
        sortByContainerView.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    @objc
    func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        sortByContainerView.isHidden = true
    }
}

extension  FileListViewController: FlightListViewModelDelegate {
    func reloadListView() {
        listView.register(FlightListViewCell.nib, forCellReuseIdentifier: FlightListViewCell.identifier)
        listView.delegate = self
        listView.dataSource = self
        listView.estimatedRowHeight = 44.0
        listView.rowHeight = UITableView.automaticDimension
        
        listView.reloadData()
        headerTitkleLabel.text = viewModel.headerTitle ?? ""
        sortByContainerView.isHidden = true
    }
}


extension FileListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlightListViewCell.identifier, for: indexPath) as? FlightListViewCell {
            
            let cellData = viewModel.dataListModel[indexPath.row]
            cell.item = cellData
            
            return cell
        }
        
        return UITableViewCell()
    }
}
