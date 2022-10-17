//
//  InboxDataSource.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import Foundation
import RxDataSources

struct InboxDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource

    static func dataSource() -> DataSource<InboxModel> {

        return .init(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InboxTableViewCell.identifier, for: indexPath) as? InboxTableViewCell else { return UITableViewCell() }
            cell.setupData(data: item)
            return cell
        }, titleForHeaderInSection: { dataSource, index in
            return dataSource.sectionModels[index].date
        })
    }
}
