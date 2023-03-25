//
//  CarouselComponent.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 19.03.2023.
//

import UIKit
import SnapKit

class CarouselComponent: DataBasedComponentView<CarouselComponentData> {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: CarouselLayout()
    )

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        return pageControl
    }()

    private lazy var currentPageNumberView: UIView = {
        let view = UIView()
        view.addSubview(currentPageNumberLabel)
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var currentPageNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    
    var urls: [URL] = []
    var selectedIndex: Int = 0
    private var timer: Timer?

    private func addSubviews() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CarouselCellComponent.self, forCellWithReuseIdentifier: CarouselCellComponent.identifier)
        addSubview(containerView)
        containerView.addSubview(collectionView)
        containerView.addSubview(pageControl)
        containerView.addSubview(currentPageNumberView)

        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }

        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }

        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom).offset(-20)
            make.leading.trailing.equalToSuperview().inset(90)
            make.height.equalTo(25)
        }

        currentPageNumberView.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom).offset(-20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }

        currentPageNumberLabel.snp.makeConstraints { $0.edges.equalToSuperview() }

        scheduleTimerIfNeeded()
    }

    deinit {
        timer?.invalidate()
    }

    override func addMajorViews() {
        super.addMajorViews()
        addSubviews()
    }

    override func loadDataIntoViews() {
        super.loadDataIntoViews()
        guard let data = returnData() else { return }
        self.urls = data.imageURLs
        self.pageControl.numberOfPages = data.imageURLs.count
        collectionView.layer.cornerRadius = data.cornerRadius ? 10 : 0
        currentPageNumberLabel.text = "\(1)/\(data.imageURLs.count)"
        if data.isMainPage {
            currentPageNumberView.isHidden = true
            pageControl.isHidden = false
        } else {
            pageControl.isHidden = true
            currentPageNumberView.isHidden = false
        }
    }

    private func scheduleTimerIfNeeded() {
        guard urls.count > 1 else { return }
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            withTimeInterval: 3.0,
            repeats: true,
            block: { [weak self] _ in
                self?.selectNext()
            }
        )
    }

    private func selectNext() {
        selectItem(at: selectedIndex + 1)
    }

    private func selectItem(at index: Int) {
        let index = urls.count > index ? index : 0
        guard selectedIndex != index else { return }
        selectedIndex = index
        collectionView.scrollToItem(at: IndexPath(item: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension CarouselComponent: UICollectionViewDataSource {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.pageControl.currentPage = currentPage
        currentPageNumberLabel.text = "\(currentPage + 1)/\(urls.count)"
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.pageControl.currentPage = currentPage
        currentPageNumberLabel.text = "\(currentPage + 1)/\(urls.count)"
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CarouselCellComponent = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCellComponent.identifier, for: indexPath) as? CarouselCellComponent else {
            return UICollectionViewCell()
        }
        cell.configure(with: urls[indexPath.row])
        return cell
    }
}

extension CarouselComponent: UICollectionViewDelegate { }

extension CarouselComponent: UICollectionViewDelegateFlowLayout { }
