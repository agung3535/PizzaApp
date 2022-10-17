//
//  HorizontalListCollectionViewCell.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class HorizontalListCollectionViewCell: UICollectionViewCell {
    static let identifier = "HorizontalListCollectionViewCell"
    weak var homeVC: HomeViewController?
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(SliderCollectionViewCell.self, forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
        view.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        view.register(OptionToppingCollectionViewCell.self, forCellWithReuseIdentifier: OptionToppingCollectionViewCell.identifier)
        view.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        view.backgroundColor = .white
        return view
    }()
    
    private let mainBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    var sectionVal: HorizontalSection!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("masuk collect")
        addSubview(mainBackground)
        addSubview(collectionView)
//        backgroundColor = .brown
        
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        setupView()
    }
    
    
    func setupMenu(menuViewModel: MenuHomeViewModel) {
        print("masuk menu = \(menuViewModel)")
        menuViewModel.getMenuData()
        menuViewModel.homeMenu.bind(to: collectionView
            .rx
            .items(cellIdentifier: MenuCollectionViewCell.identifier, cellType: MenuCollectionViewCell.self)) { row, element, cell in
                cell.setupData(data: element)
            }.disposed(by: disposeBag)
        collectionView.rx
            .modelSelected(MenuModel.self)
            .subscribe(onNext: {[weak self] menu in
                guard let self = self else { return }
                switch menu.type {
                    
                case .menu:
                    let vc = MenuViewController()
                    vc.viewModel = MenuListViewModel()
                    vc.hidesBottomBarWhenPushed = true
                    self.homeVC?.navigationController?.pushViewController(vc, animated: true)
                case .myVoucher:
                    let vc = MyVoucherViewController()
                    vc.viewModel = MyVoucherViewModel()
                    vc.hidesBottomBarWhenPushed = true
                    self.homeVC?.navigationController?.pushViewController(vc, animated: true)
                }
                
                
            }).disposed(by: disposeBag)
        
    }
    
    func setupNews(vm: NewsViewModel) {
        print("masuk news")
        vm.getNewsData()
        vm.newsData.bind(to: collectionView
            .rx
            .items(cellIdentifier: NewsCollectionViewCell.identifier, cellType: NewsCollectionViewCell.self)) { row, element, cell in
                cell.setupData(data: element)
            }.disposed(by: disposeBag)
    }
    
    func setupSlide(vm: SlideViewModel) {
        vm.getSliderHome()
        collectionView.layer.shadowColor = UIColor.gray.cgColor
        collectionView.layer.shadowOpacity = 1
        collectionView.layer.shadowOffset = CGSize.zero
        collectionView.layer.shadowRadius = 3
        collectionView.layer.cornerRadius = 5
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.layer.masksToBounds = false
        vm.sliderData.bind(to: collectionView
            .rx
            .items(cellIdentifier: SliderCollectionViewCell.identifier, cellType: SliderCollectionViewCell.self)) { row, element, cell in
                cell.setupData(data: element)
            }.disposed(by: disposeBag)
    }
    
    func setupPinggiran(vm: DetailMenuViewModel, pizza: PizzaMenu) {
        
        vm.getDetailPinggiran(id: pizza.id)
        vm.detailPinggiran.bind(to: collectionView
            .rx
            .items(cellIdentifier: OptionToppingCollectionViewCell.identifier, cellType: OptionToppingCollectionViewCell.self)) { row, element, cell in
                cell.setupPinggiran(data: element)
            }.disposed(by: disposeBag)
    }
    
    func setupUkuran(vm: DetailMenuViewModel, pizza: PizzaMenu) {
    
        vm.getDetailUkuran(id: pizza.id)
        vm.detailUkuran.bind(to: collectionView
            .rx
            .items(cellIdentifier: OptionToppingCollectionViewCell.identifier, cellType: OptionToppingCollectionViewCell.self)) { row, element, cell in
                cell.setupUkuran(data: element)
            }.disposed(by: disposeBag)
    }
    
    
    
    func setupView() {
       
        NSLayoutConstraint.activate([
            mainBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainBackground.topAnchor.constraint(equalTo: topAnchor),
            mainBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
//            mainBackground.heightAnchor.constraint(equalToConstant: 25),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        print("masuk setup view \(collectionView.frame.size.width)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


enum HorizontalSection: String {
    case menu = "menu"
    case news = "news"
    case slider = "slider"
    case topping = "pinggiran"
    
    
}

extension HorizontalListCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch sectionVal {
        case .news:
            return CGSize(width: collectionView.frame.width / 1.2, height: collectionView.frame.height / 1)
        case .menu:
            return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height / 1)
        case .slider:
            return CGSize(width: collectionView.frame.width / 1, height: collectionView.frame.height / 1)
        case .none:
            return CGSize(width: 0, height: 0)
        case .some(.topping):
            return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height / 1)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch sectionVal {
        case .news:
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

        case .menu:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        case .none:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case .slider:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case .topping:
            let totalCellWidth = 80 * collectionView.numberOfItems(inSection: 0)
            let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)

            let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset

            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch sectionVal {
        case .slider:
            return CGFloat(0)
        case .news:
            return CGFloat(10)
            
        case .menu:
            return CGFloat(0)
        case .topping:
            return CGFloat(0)
        case .none:
            return CGFloat(0)
        }
    }
}
