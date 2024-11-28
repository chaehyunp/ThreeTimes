import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    // 1. 스크롤  OK
    // 2. 데이터 붙이기 - 일러스트 포함 OK
    // 3. 플러스 버튼 눌렀을때 아래에 상품 추가
    // 4. 바텀뷰 버튼 이벤트 - 전체 취소, 알러트
    
    
    // MARK: - Properties
    private let scrollView = UIScrollView()
    private let spacingView = UIView()
    private var collectionView: UICollectionView!
    private let segmentedControl = UISegmentedControl(items: ProductData.segmentedControlTitles)
    private let pageControl = UIPageControl()
    private let contentView = UIView()
    private let bottomView = BottomView()
    
    // Sample Data
    private let productCategories = ProductData.productCategories
    private var filteredProducts: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "00")
        
        // 1. 네비게이션 + 세그먼트 + 스크롤 뷰
        setupNavigationBar()
        setupSegmentedControl()
        setupScrollView()
        
        // 2-1. 스크롤 뷰 내 상단
        setupCollectionView()
        setupPageControl()
        
        // 2-2. 스크롤 뷰 내 하단: 바텀뷰
        setupBottomView()
        
        // Initialize Filtered Data
        filteredProducts = productCategories.flatMap { $0.value }
        updatePageControl()
    }
    
    // MARK: - Setup BottomView
    private func setupBottomView() {
        scrollView.addSubview(bottomView)
        
        bottomView.snp.makeConstraints{ make in
            make.top.equalTo(pageControl.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Setup Navigation Bar
    private func setupNavigationBar() {
        navigationItem.title = "WINDYJUNG"
    }
    
    // MARK: - Setup ScrollView
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor(named: "100")
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
//            make.top.equalTo(segmentedControl.snp.bottom)
            make.top.equalTo(spacingView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        // 콘텐츠 영역
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
    }
    
    // MARK: - Setup Segmented Control
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }

        view.addSubview(spacingView)

        spacingView.snp.makeConstraints{ make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        
    }
    
    // MARK: - Setup Collection View
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 350)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "100")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.identifier)
        

        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
            make.top.equalTo(scrollView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }

    }
    
    
    // MARK: - Setup Page Control
    private func setupPageControl() {
        pageControl.currentPageIndicatorTintColor = UIColor(named: "950")
        pageControl.pageIndicatorTintColor = UIColor(named: "600")
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        
        contentView.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func pageControlChanged(_ sender: UIPageControl) {
        let xOffset = CGFloat(sender.currentPage) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }
    
    // MARK: - Update Page Control
    private func updatePageControl() {
        let totalPages = Int(ceil(Double(filteredProducts.count) / 4.0))
        pageControl.numberOfPages = totalPages
        pageControl.currentPage = 0
    }
    
    // MARK: - Segmented Control Action
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let selectedCategory = ProductData.segmentedControlTitles[sender.selectedSegmentIndex]
        
        if selectedCategory == "전체" {
            filteredProducts = productCategories.flatMap { $0.value }
        } else {
            filteredProducts = productCategories[selectedCategory] ?? []
        }
        
        collectionView.reloadData()
        updatePageControl()
    }
    
    // MARK: - UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(ceil(Double(filteredProducts.count) / 4.0)) // 페이지 수
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.identifier, for: indexPath) as? PageCell else {
            return UICollectionViewCell()
        }
        
        // Fetch data for the current page
        let startIndex = indexPath.item * 4
        let endIndex = min(startIndex + 4, filteredProducts.count)
        let productsForPage = Array(filteredProducts[startIndex..<endIndex])
        
        cell.configure(with: productsForPage)
        return cell
    }
    
    
    // MARK: - UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
}

// MARK: - Custom Page Cell
class PageCell: UICollectionViewCell {
    
    static let identifier = "PageCell"
    
    private let productUIView = UIView()
    private let mainStackView = UIStackView()
    
    private let productImageView = UIImageView()
    private let productNameLabel = UILabel()
    private let productPriceLabel = UILabel()
    private let addButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(productUIView)
        productUIView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        productUIView.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mainStackView.distribution = .fillEqually
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        productUIView.snp.makeConstraints { make in
            make.height.equalTo(250)  // 원하는 높이 설정
        }
        
        // Configure each UI component here (productImageView, productNameLabel, productPriceLabel, addButton)
    }
    
    func configure(with products: [Product]) {
        // 기존에 추가된 뷰 제거
        mainStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // 최대 4개의 제품을 2열 2행으로 배치
        let rows = 2
        let columns = 2
        let totalItems = min(products.count, rows * columns)
        
        for rowIndex in 0..<rows {
            // 각 행을 위한 수평 스택 뷰 생성
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 16
            rowStackView.distribution = .fillEqually
            
            for columnIndex in 0..<columns {
                let itemIndex = rowIndex * columns + columnIndex
                if itemIndex < totalItems {
                    // 제품에 대한 네모 박스 생성
                    let productView = createProductView(for: products[itemIndex])
                    rowStackView.addArrangedSubview(productView)
                } else {
                    // 빈 뷰 추가 (필요 시)
                    let emptyView = UIView()
                    rowStackView.addArrangedSubview(emptyView)
                }
            }
            mainStackView.addArrangedSubview(rowStackView)
        }
    }
    
    // MARK: - Helper: Product View 생성
    private func createProductView(for product: Product) -> UIView {
        // 전체 상품 뷰 설정
        let productView = UIView()
        productView.layer.cornerRadius = 10
        productView.layer.borderWidth = 1
        productView.layer.borderColor = UIColor.lightGray.cgColor
        productView.backgroundColor = UIColor(named: "00")
        productView.clipsToBounds = true
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: "100")
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: product.img) // 예시 이미지
        imageView.contentMode = .scaleAspectFit
        
        // 라벨 설정
        let nameLabel = UILabel()
        
        nameLabel.text = "\(product.name)"
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.textColor = UIColor(named: "950")
        
        let priceLabel = UILabel()
        
        priceLabel.text = "\(product.price)"
        priceLabel.textAlignment = .left
        priceLabel.font = .boldSystemFont(ofSize: 14)
        priceLabel.textColor = UIColor(named: "950")
        
        let button = UIButton()
        if let buttonImage = UIImage(named: "addButtonIcon") {
            button.setBackgroundImage(buttonImage, for: .normal)
        }
        button.layer.cornerRadius = 17
        
        // 이미지 뷰와 라벨을 세로로 배치할 스택 뷰 설정
        let productStackView = UIStackView()
        productStackView.axis = .vertical
        productStackView.spacing = 3
        productStackView.alignment = .fill
        productStackView.distribution = .fill
//        productStackView.backgroundColor = .white
        // 이미지뷰와 라벨을 스택뷰에 추가
        productStackView.addArrangedSubview(imageView)
        productStackView.addArrangedSubview(nameLabel)
        productStackView.addArrangedSubview(priceLabel)
        
        // 상품 뷰에 스택뷰 추가
        productView.addSubview(productStackView)
        
        // productView 크기 조정 (height 변경)
        productView.snp.makeConstraints { make in
            make.height.equalTo(250)  // 예시로 높이를 220으로 설정 (원하는 높이로 변경 가능)
        }
        
        // 스택뷰 제약 설정
        productStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8) // 상단과 좌우에 8px 여백 설정
        }
        
        // 버튼을 오른쪽 아래에 배치하기 위해 제약 설정
        productView.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(8) // 오른쪽 아래에 8px 여백 설정
            make.width.height.equalTo(34) // 버튼 크기 설정
        }
        
        // 이미지 뷰 제약 설정
        imageView.snp.makeConstraints { make in
            make.height.equalTo(90) // 이미지 뷰의 고정 높이
            
//            let size = productStackView.frame.height
//            make.height.equalTo(size)
            make.width.equalToSuperview() // 이미지 뷰의 너비를 부모 뷰에 맞게 설정
        }
        
        // 라벨 제약 설정
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.height.equalTo(20)// 라벨의 고정 높이
        }
        return productView
    }
}
