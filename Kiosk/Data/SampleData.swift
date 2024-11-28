import Foundation

struct Product {
    let img: String
    let name: String
    let price: String
}

//struct SampleData {
//    static let productCategories: [String: [Product]] = [
//        "붕어빵": [
//            Product(name: "팥 붕어빵", price: "1,000원"),
//            Product(name: "슈크림 붕어빵", price: "1,000원"),
//            Product(name: "피자 붕어빵", price: "1,500원"),
//            Product(name: "초코 붕어빵", price: "1,500원"),
//            Product(name: "딸기 붕어빵", price: "2,000원")
//        ],
//        "호떡": [
//            Product(name: "꿀 호떡", price: "1,200원"),
//            Product(name: "씨앗 호떡", price: "1,500원"),
//            Product(name: "공갈 호떡", price: "1,800원"),
//            Product(name: "초코 호떡", price: "2,000원")
//        ]
//    ]
//    // Segmented Control Titles
//    static let segmentedControlTitles = ["전체", "붕어빵", "호떡", "기타"]
//}

struct ProductData {
    static let productCategories: [String: [Product]] = [
        "finshBun": [
            Product(img: "ImgFishBunRedBean", name: "fishBunRedBean", price: "1000"),
            Product(img: "ImgFishBunCustard", name: "fishBunCustard", price: "1000"),
            Product(img: "ImgFishBunCheese", name: "fishBunCheese", price: "1500"),
            Product(img: "ImgFishBunChoco", name: "fishBunChoco", price: "1500"),
            Product(img: "ImgFishBunPizza", name: "fishBunPizza", price: "2000"),
            Product(img: "ImgFishBunMatcha", name: "fishBunMatcha", price: "2000")
        ],
        "hoppang": [
            Product(img: "ImghoppangHoney", name: "hoppangHoney", price: "1200"),
            Product(img: "ImghoppangBubble", name: "hoppangBubble", price: "1800"),
            Product(img: "ImghoppangRedBean", name: "hoppangRedBean", price: "2000"),
            Product(img: "ImghoppangMatcha", name: "hoppangMatcha", price: "2000"),
            Product(img: "ImghoppangChoco", name: "hoppangChoco", price: "2000"),
        ],
        "skewer": [
            Product(img: "ImgSkewerSoySauce", name: "skewerSoySauce", price: "1200"),
            Product(img: "ImgSkewerGreenOnion", name: "skewerGreenOnion", price: "1500"),
            Product(img: "ImgSkewerHotFried", name: "skewerHotFried", price: "1800"),
            Product(img: "ImgSkewerFried", name: "skewerFried", price: "2000"),
            Product(img: "ImgSkewerHotBar", name: "skewerHotBar", price: "2000")
        ],
        "else": [
            Product(img: "ImgRoastedChestnuts", name: "roastedChestnuts", price: "1200"),
            Product(img: "ImgRoastedSweetPotatoes", name: "roastedSweetPotatoes", price: "1500"),
            Product(img: "ImgTakoyaki", name: "takoyaki", price: "1800"),
            Product(img: "ImgTenWonBread", name: "tenWonBread", price: "2000"),
            Product(img: "ImgDeliManju", name: "deliManju", price: "2000")
        ]
    ]
    static let segmentedControlTitles = ["fishBun", "hoppang", "skewer", "else"]
}


