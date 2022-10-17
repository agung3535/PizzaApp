//
//  InboxModel.swift
//  PizzaHut
//
//  Created by Putra on 07/10/22.
//

import Foundation
import RxDataSources

struct InboxModel {
    let date: String
    let items: [InboxResource]
}


struct InboxResource {
    let title, desc: String
}


extension InboxModel: SectionModelType {
    
    typealias Item = InboxResource
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
    
}

struct TableViewItem {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

struct TableViewSection {
    let items: [TableViewItem]
    let header: String
    
//    init(items: [TableViewItem], header: String) {
//        self.items = items
//        self.header = header
//    }
}

extension TableViewSection: SectionModelType {
    typealias Item = TableViewItem
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}



//struct IntermediateDataSource {
//    typealias DataSource = RxTableViewSectionedReloadDataSource
//
//    static func dataSource() -> DataSource<TableViewSection> {
//
//        return .init(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
//            print("masuk init data = \(dataSource[indexPath.section].items.count)")
//            print("maasuk cell")
//            let cell = IntermediateTableViewCell()
//            cell.viewModel = IntermediateItemViewModel(itemModel: item)
//            return cell
//        }, titleForHeaderInSection: { dataSource, index in
//            print("masuk header")
//            return dataSource.sectionModels[index].header
//        })
//    }
//}
