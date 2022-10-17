//
//  MenuViewController.swift
//  PizzaHut
//
//  Created by Putra on 06/10/22.
//

import UIKit
import RxSwift
import RxCocoa
class MenuViewController: UIViewController {
    
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = UITableView.automaticDimension
        view.register(FoodMenuTableViewCell.self, forCellReuseIdentifier: FoodMenuTableViewCell.identifier)
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    var menu = [PizzaMenu]()
    
    var viewModel: MenuListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        viewModel.getMenuData()
        title = "Menu"
        self.navigationController?.navigationBar.topItem?.title = " "
        viewModel.listMenu.bind(to: tableView
            .rx
            .items(cellIdentifier: FoodMenuTableViewCell.identifier, cellType: FoodMenuTableViewCell.self)) { row, element, cell in
                cell.setupMenu(data: element)
            }.disposed(by: disposeBag)
        tableView.rx.modelSelected(PizzaMenu.self)
            .subscribe(onNext: {[weak self] menu in
                guard let self = self else {return}
                let vc = DetailMenuViewController()
                vc.pizza = menu
                vc.vm = DetailMenuViewModel()
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        setupConstraint()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
