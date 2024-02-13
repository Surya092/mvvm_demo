//
//  HomeViewController.swift
//  mvcdemo
//
//  Created by Suryanarayan Sahu on 07/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    var viewModel = HomeViewModel()
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        viewModel.delegate = self
        navigationController?.navigationBar.topItem?.title = viewModel.getNavigationTitle()
        viewModel.setDataOnLoad()
    }
    
}

//MARK: HomeView Extension
extension HomeViewController: HomeViewModelProtocol {
    func updateTableView() {
        self.homeTableView.reloadData()
    }
}

//MARK: TableView Datasource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getTableViewItemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = HomeCellViewModel(model: viewModel, index: indexPath.row)
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        cell.viewModel = viewModel
        cell.setData()
        return cell
    }
}

//MARK: TableView Delegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! HomeTableViewCell
        let dataLabel = cell.viewModel.getCellData()
        let landingPageController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandingPageViewController") as! LandingPageViewController
        landingPageController.dataLabel = dataLabel
        landingPageController.pageTitle = dataLabel
        navigationController?.pushViewController(landingPageController, animated: true)
    }
}

