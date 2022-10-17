//
//  MyVoucherViewController.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class MyVoucherViewController: UIViewController {

    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = UITableView.automaticDimension
        view.register(MyVoucherTableViewCell.self, forCellReuseIdentifier: MyVoucherTableViewCell.identifier)
        view.separatorStyle = .none
        return view
    }()
    private let disposeBag = DisposeBag()
    var viewModel: MyVoucherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "My Voucher"
        self.navigationController?.navigationBar.topItem?.title = " "

        setupConstraint()
        viewModel.getVoucherData()
        viewModel.listVoucher.bind(to: tableView
            .rx
            .items(cellIdentifier: MyVoucherTableViewCell.identifier, cellType: MyVoucherTableViewCell.self)) { row, element, cell in
                cell.setupData(data: element)
            }.disposed(by: disposeBag)

        // Do any additional setup after loading the view.
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
