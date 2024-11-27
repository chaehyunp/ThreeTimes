import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  // MARK: - 박진홍 테스트 코드
    /*
     private let bottomView = BottomView()
     
     override func viewDidLoad() {
     super.viewDidLoad()
     view.backgroundColor = .white
     setupCartTableView()
     setupButtons()
     }
     //추후 레이아웃 맞춰야 함.
     private func setupCartTableView() {
     view.addSubview(bottomView)
     bottomView.translatesAutoresizingMaskIntoConstraints = false
     
     NSLayoutConstraint.activate([
     bottomView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
     bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
     bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
     ])
     }
     //임시 추가 삭제 버튼들
     private func setupButtons() {
     let addButton = UIButton(type: .system)
     addButton.setTitle("상품 추가", for: .normal)
     addButton.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
     
     let deleteButton = UIButton(type: .system)
     deleteButton.setTitle("상품 삭제", for: .normal)
     deleteButton.addTarget(self, action: #selector(removeLastProduct), for: .touchUpInside)
     
     let buttonStack = UIStackView(arrangedSubviews: [addButton, deleteButton])
     buttonStack.axis = .horizontal
     buttonStack.spacing = 20
     buttonStack.alignment = .center
     buttonStack.distribution = .equalSpacing
     
     view.addSubview(buttonStack)
     buttonStack.translatesAutoresizingMaskIntoConstraints = false
     
     NSLayoutConstraint.activate([
     buttonStack.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 20),
     buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
     ])
     }
     //셀 추가 메서드 연결
     @objc private func addProduct() {
     let newProduct = "상품 \(bottomView.cartView.data.count + 1)"//새로운 셀 데이터
     bottomView.cartView.addProduct(newProduct)
     bottomView.updateCartHeight()
     }
     //셀 삭제 메서드 연결
     @objc private func removeLastProduct() {
     guard !bottomView.cartView.data.isEmpty else { return }
     bottomView.cartView.removeProduct(at: bottomView.cartView.data.count - 1)
     bottomView.updateCartHeight()
     }
     }
     
     #Preview {
     ViewController()
     }
     */
    // MARK: - 박진홍 테스트 코드 끝

    // MARK: - Properties
    private var collectionView: UICollectionView!
    private let segmentedControl = UISegmentedControl(items: ["전체", "붕어빵", "호떡", "기타"])
    
    // Sample Data
    private let productCategories = [
        "붕어빵": [
            ("팥 붕어빵", "1,000원"),
            ("슈크림 붕어빵", "1,000원"),
            ("피자 붕어빵", "1,500원"),
            ("초코 붕어빵", "1,500원"),
            ("딸기 붕어빵", "2,000우")
        ],
        "호떡": [
            ("꿀 호떡", "1,200원"),
            ("씨앗 호떡", "1,500원"),
            ("공갈 호떡", "1,800원"),
            ("초코 호떡", "2,000원")
        ]
    ]
    
    private var filteredProducts: [(String, String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupSegmentedControl()
        setupCollectionView()

        // Initialize Filtered Data
        filteredProducts = productCategories.flatMap { $0.value }

    }

    // MARK: - Setup Navigation Bar
    private func setupNavigationBar() {
        navigationItem.title = "WinterDessert"
    }

    // MARK: - Setup Segmented Control
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

    // MARK: - Setup Collection View
    private func setupCollectionView() {
        // Layout Configuration
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16

        // Initialize Collection View
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self

        // Register Custom Cell
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)

        // Add Collection View to View
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }

    // MARK: - Segmented Control Action
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // 전체
            filteredProducts = productCategories.flatMap { $0.value }
        case 1: // 붕어빵
            filteredProducts = productCategories["붕어빵"] ?? []
        case 2: // 피자 붕어빵 (필터를 세분화하려면 아래처럼 커스텀 조건 추가)
            filteredProducts = productCategories["호떡"] ?? []
        case 3: // 호떡
            filteredProducts = productCategories["기타"] ?? []
        default:
            break
        }
        collectionView.reloadData()
    }


    // MARK: - UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProducts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }

        let (name, price) = filteredProducts[indexPath.item]
        cell.configure(name: name, price: price)
        return cell
    }

    // MARK: - UICollectionView Delegate Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 48) / 2, height: 200) // 2 columns layout
    }
}

// MARK: - Custom CollectionView Cell
class ProductCell: UICollectionViewCell {
    static let identifier = "ProductCell"

    // UI Components
    private let productUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        if let buttonImage = UIImage(named: "addButtonIcon") {
            button.setBackgroundImage(buttonImage, for: .normal)
        }
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Setup UI for Cell
    private func setupCell() {
        contentView.addSubview(productUIView)
        productUIView.addSubview(productImageView)
        productUIView.addSubview(productNameLabel)
        productUIView.addSubview(productPriceLabel)
        productUIView.addSubview(addButton)
        
        productUIView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        productImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(112)
        }

        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(8)
        }

        addButton.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(8)
            make.width.height.equalTo(34)
        }
    }

    // Configure Cell
    func configure(name: String, price: String) {
        productNameLabel.text = name
        productPriceLabel.text = price
    }
    @objc private func addButtonTapped() {
        print("상품이 추가되었습니다.")
    }
}

