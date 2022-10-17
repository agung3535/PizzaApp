//
//  DataDummy.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import Foundation


final class DataDummy {
    
    
    static func generateMenuPizza() -> [PizzaMenu] {
        var data = [PizzaMenu]()
        
        let sizePersonal = Ukuran(id: 1, typeSize: "Personal", description: "4 Slices")
        let sizeRegular = Ukuran(id: 2, typeSize: "Regular", description: "6 - 8 Slices")
        let sizeJumbo = Ukuran(id: 3, typeSize: "Jumbo", description: "10 Slices")
        
        let pinggirOriginal = Pinggiran(id: 1, typePinggiran: "Original")
        let pinggirStuffedCrustKeju = Pinggiran(id: 2, typePinggiran: "Stuffed Crust Keju")
        let pinggirStuffedCrustSosis = Pinggiran(id: 3, typePinggiran: "Stuffed Crust Sosis")
        let pinggirCheesyBite = Pinggiran(id: 4, typePinggiran: "Cheesy Bites")
        
        data.append(PizzaMenu(id: 1, name: "HEBOH Beef Corn", description: "Burger Sapi, Jagung dan Kezu Mozzarella", image: "beef-corn", price: 17001, ukuran: [sizePersonal], pinggiran: [pinggirOriginal]))
        data.append(PizzaMenu(id: 2, name: "HEBOH Creamy Tomato Chicken", description: "Sosis Ayamm, Daging Ayam Asap, Saus Tomat Mayo dan Keju Mozzarella", image: "creamy-tomato-chicken", price: 17001, ukuran: [sizePersonal], pinggiran: [pinggirOriginal]))
        data.append(PizzaMenu(id: 3, name: "HEBOH Beef BBQ", description: "Sosis Sapi, Onion, Saus BBQ, dan Keju Mozzarella", image: "beef-bbq", price: 17001, ukuran: [sizePersonal], pinggiran: [pinggirOriginal]))
        data.append(PizzaMenu(id: 4, name: "Hawaian Chicken", description: "Daging Ayam Berbalut Tepung Roti, Nanas, Paprikam Kezu Mozzarella, Saus Tomat Spicy", image: "hawaiian-chicken", price: 17001, ukuran: [sizeRegular, sizeJumbo], pinggiran: [pinggirOriginal, pinggirStuffedCrustKeju, pinggirStuffedCrustSosis, pinggirCheesyBite]))
        
        return data
    }
    
    static func getDetailPizza(id: Int) -> PizzaMenu {
        let data = generateMenuPizza()
        return data.first(where: {$0.id == id})!
    }
    
    static func getDetailPinggiran(id: Int) -> [Pinggiran] {
        let data = generateMenuPizza()
        return data.first(where: {$0.id == id})!.pinggiran
    }
    
    static func getDetailUkuran(id: Int) -> [Ukuran] {
        let data = generateMenuPizza()
        return data.first(where: {$0.id == id})!.ukuran
    }
    
    static func generateMenu() -> [MenuModel] {
        var data = [MenuModel]()
        
        data.append(MenuModel(id: 1, name: "Menu", icon: "ic_menu", type: .menu))
        data.append(MenuModel(id: 2, name: "My Voucher", icon: "ic_voucher", type: .myVoucher))
        
        return data
    }
    
    static func mapDataPizzaToDetail(data: PizzaMenu) -> [DetailPizzaMenuSection]{
        var dataMap = [DetailPizzaMenuSection]()
        dataMap.append(DetailPizzaMenuSection(items: [data], header: "Info"))
        dataMap.append(DetailPizzaMenuSection(items: [Pinggiran(id: 0, typePinggiran: "")], header: "Pilih Pinggiran"))
        dataMap.append(DetailPizzaMenuSection(items: [Ukuran(id: 0, typeSize: "", description: "")], header: "Pilih Ukuran"))
//        data.append(DetailPizzaMenuSection(items: [1], header: "Quantity"))
        
        return dataMap
    }
    
    static func generateVoucher() -> [VoucerModel] {
        var data = [VoucerModel]()
        data.append(VoucerModel(id: 1, image: "vc_ongkir", title: "FREEDELIVERY PHR", desc: "Gratis ongkos kirim dengan minimal pembelian Rp.200.000 di Pizza Hut Restaurant", validData: "29/04/2023"))
        data.append(VoucerModel(id: 2, image: "vc_ongkir", title: "FREEDELIVERY PHD", desc: "Gratis ongkos kirim dengan minimal pembelian Rp.200.000 di Pizza Hut Delivery", validData: "29/04/2023"))
        
        return data
    }
    
    static func generateNews() -> [NewsModel] {
        var data = [NewsModel]()
        data.append(NewsModel(id: 1, image: "banner-mixmatch"))
        data.append(NewsModel(id: 2, image: "banner-duodelux"))
        data.append(NewsModel(id: 3, image: "banner-limopizza"))
        data.append(NewsModel(id: 4, image: "banner-gopay"))
        
        return data
    }
    
    static func generateSlide() -> [SlideModel] {
        var data = [SlideModel]()
        data.append(SlideModel(id: 1, title: "Welcome to Pizza hut Indonesia App"))
        data.append(SlideModel(id: 1, title: "The Flavor of Now"))
        return data
    }
    
    static func generateHome() -> [HomeDomainModel] {
        
        var data = [HomeDomainModel]()
        data.append(HomeDomainModel(items: [SlideModel(id: 0, title: "")], title: "Slide"))
        data.append(HomeDomainModel(items: [MenuModel(id: 0, name: "", icon: "", type: .menu)], title: "Menu"))
        data.append(HomeDomainModel(items: [NewsModel(id: 0, image: "")], title: "News"))
        
        return data
    }
    
    static func genereateInboxResource() -> [InboxResource] {
        var data = [InboxResource]()
        data.append(InboxResource(title: "Baru di Agustus, Pizza Merah Putih", desc: "Pizza kotak dengan pinggiran keju crispy siap bikin momen perayaan kemerdekaan jadi menyenangkan"))
        data.append(InboxResource(title: "Baru di Agustus, Pizza Merah Putih", desc: "Pizza kotak dengan pinggiran keju crispy siap bikin momen perayaan kemerdekaan jadi menyenangkan"))
        return data
    }
    
    static func generateInbox() -> [InboxModel] {
        var data = [InboxModel]()
        let resource = genereateInboxResource()
        data.append(InboxModel(date: "August 2022", items: resource))
        data.append(InboxModel(date: "July 2022", items: resource))
        
        return data
    }
    
//    static func generateTable() -> [TableViewSection] {
//        var data = [TableViewSection]()
//        var tbItem = [TableViewItem]()
//        var data2 = TableViewSection(items: [
//            TableViewItem(title: "One"),
//        ], header: "First section")
//        tbItem.append(TableViewItem(title: "ABC"))
//        data.append(data2)
//        data.append(TableViewSection(items: tbItem, header: "Section 2"))
//
//        return data
//
//
//    }
    
//    static func generatTable2() -> [TableViewSection] {
//        var data = [
//            TableViewSection(items: [
//            
//                TableViewItem(title: "One"),
//                TableViewItem(title: "Two"),
//    //            TableViewItem(title: "Three"),
//    //            TableViewItem(title: "Four"),
//    //            TableViewItem(title: "Five"),
//    //            TableViewItem(title: "Six")
//                
//            ], header: "First section"),
//            
//            TableViewSection(items: [
//
//                TableViewItem(title: "Seven"),
//    //            TableViewItem(title: "Eight"),
//    //            TableViewItem(title: "Nine"),
//    //            TableViewItem(title: "Ten"),
//    //            TableViewItem(title: "Evelen"),
//    //            TableViewItem(title: "Twelve")
//
//            ], header: "Second section")
//        ]
//        
//        return data
//    }
}
