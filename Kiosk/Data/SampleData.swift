import Foundation

struct Product {
    let name: String
    let price: String
}

struct SampleData {
    static let productCategories: [String: [Product]] = [
        "붕어빵": [
            Product(name: "팥 붕어빵", price: "1,000원"),
            Product(name: "슈크림 붕어빵", price: "1,000원"),
            Product(name: "피자 붕어빵", price: "1,500원"),
            Product(name: "초코 붕어빵", price: "1,500원"),
            Product(name: "딸기 붕어빵", price: "2,000원")
        ],
        "호떡": [
            Product(name: "꿀 호떡", price: "1,200원"),
            Product(name: "씨앗 호떡", price: "1,500원"),
            Product(name: "공갈 호떡", price: "1,800원"),
            Product(name: "초코 호떡", price: "2,000원")
        ]
    ]
    // Segmented Control Titles
    static let segmentedControlTitles = ["전체", "붕어빵", "호떡", "기타"]
}


