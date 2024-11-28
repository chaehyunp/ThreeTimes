//import UIKit
//import SnapKit
//
//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    // MARK: - Properties
//    private var collectionView: UICollectionView!
//    private let segmentedControl = UISegmentedControl(items: SampleData.segmentedControlTitles)
//    
//    // Sample Data
//    private let productCategories = SampleData.productCategories
//    
//    private var filteredProducts: [Product] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        setupNavigationBar()
//        setupSegmentedControl()
//        setupCollectionView()
//
//        // Initialize Filtered Data
//        filteredProducts = productCategories.flatMap { $0.value }
//
//    }
//
//    // MARK: - Setup Navigation Bar
//    private func setupNavigationBar() {
//        navigationItem.title = "WinterDessert"
//    }
//
//    // MARK: - Setup Segmented Control
//    private func setupSegmentedControl() {
//        segmentedControl.selectedSegmentIndex = 0
//        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
//        
//        view.addSubview(segmentedControl)
//        segmentedControl.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
//            make.leading.trailing.equalToSuperview().inset(16)
//        }
//    }
//
//    // MARK: - Setup Collection View
//    private func setupCollectionView() {
//        // Layout Configuration
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 16
//        layout.minimumInteritemSpacing = 16
//
//        // Calculate item size for 4 items per row
//        let totalSpacing = layout.minimumInteritemSpacing * 3 + 32 // 3간격 + 좌우 16씩 여백
//        let itemWidth = (view.frame.width - totalSpacing) / 4
//        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
//
//        // Initialize Collection View
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .white
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        // Register Custom Cell
//        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
//
//        // Add Collection View to View
//        view.addSubview(collectionView)
//        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
//            make.leading.trailing.bottom.equalToSuperview().inset(16)
//        }
//    }
//
//
//    // MARK: - Segmented Control Action
//    @objc private func segmentChanged(_ sender: UISegmentedControl) {
//        let selectedCategory = SampleData.segmentedControlTitles[sender.selectedSegmentIndex]
//
//        if selectedCategory == "전체" {
//            filteredProducts = productCategories.flatMap { $0.value }
//        } else {
//            filteredProducts = productCategories[selectedCategory] ?? []
//        }
//
//        collectionView.reloadData()
//
//    }
//
//
//    // MARK: - UICollectionView DataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return min(filteredProducts.count, 4) // 최대 4개 표시
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
//            return UICollectionViewCell()
//        }
//
//        let product = filteredProducts[indexPath.item]
//        cell.configure(name: product.name, price: product.price)
//        return cell
//    }
//
//    // MARK: - UICollectionView Delegate Flow Layout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (view.frame.width - 48) / 2, height: 200) // 2 columns layout
//    }
//}
//
//// MARK: - Custom CollectionView Cell
//class ProductCell: UICollectionViewCell {
//    static let identifier = "ProductCell"
//
//    // UI Components
//    private let productUIView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 6
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 1
//        return view
//    }()
//    
//    private let productImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
//        imageView.layer.cornerRadius = 6
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//    private let productNameLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .white
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 14)
//        label.textAlignment = .left
//        return label
//    }()
//    
//    private let productPriceLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .white
//        label.textColor = .black
//        label.font = .boldSystemFont(ofSize: 14)
//        label.textAlignment = .left
//        return label
//    }()
//    
//    private let addButton: UIButton = {
//        let button = UIButton()
//        if let buttonImage = UIImage(named: "addButtonIcon") {
//            button.setBackgroundImage(buttonImage, for: .normal)
//        }
//        button.layer.cornerRadius = 17
//        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
//        return button
//    }()
//    
//    // Initialization
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupCell()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // Setup UI for Cell
//    private func setupCell() {
//        contentView.addSubview(productUIView)
//        productUIView.addSubview(productImageView)
//        productUIView.addSubview(productNameLabel)
//        productUIView.addSubview(productPriceLabel)
//        productUIView.addSubview(addButton)
//        
//        productUIView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        productImageView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview().inset(12)
//            make.height.equalTo(112)
//        }
//
//        productNameLabel.snp.makeConstraints { make in
//            make.top.equalTo(productImageView.snp.bottom).offset(8)
//            make.leading.trailing.equalToSuperview().inset(8)
//        }
//
//        productPriceLabel.snp.makeConstraints { make in
//            make.top.equalTo(productNameLabel.snp.bottom).offset(4)
//            make.leading.equalToSuperview().inset(8)
//        }
//
//        addButton.snp.makeConstraints { make in
//            make.bottom.trailing.equalToSuperview().inset(8)
//            make.width.height.equalTo(34)
//        }
//    }
//
//    // Configure Cell
//    func configure(name: String, price: String) {
//        productNameLabel.text = name
//        productPriceLabel.text = price
//    }
//    @objc private func addButtonTapped() {
//        print("상품이 추가되었습니다.")
//    }
//}
