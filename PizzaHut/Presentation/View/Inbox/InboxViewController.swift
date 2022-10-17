//
//  InboxViewController.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class InboxViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView
            .translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.sectionHeaderHeight = CGFloat(30)
        tableView.tableHeaderView?.backgroundColor = .lightGray
        tableView.register(InboxTableViewCell.self, forCellReuseIdentifier: InboxTableViewCell.identifier)
        return tableView
    }()
    
    var viewModel: InboxViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupConstraint()
//        tableView.rx
//            .setDelegate(self).disposed(by: disposeBag)
        viewModel.getInbox()
        viewModel.inboxData.bind(to: tableView
            .rx
            .items(dataSource: viewModel.dataSource))
        .disposed(by: disposeBag)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        title = "Inbox"
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

//extension InboxViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 42)
//        let headerView = UIView(frame: frame)
//        headerView.backgroundColor = UIColor.lightGray
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 40
//        }
//}
