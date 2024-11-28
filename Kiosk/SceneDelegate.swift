import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Create the main window
        window = UIWindow(windowScene: windowScene)

        // Create the main view controller and wrap it with UINavigationController
        let mainViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        // Set the navigation controller as the root view controller
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
