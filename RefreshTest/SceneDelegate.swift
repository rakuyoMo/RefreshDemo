import UIKit

class SceneDelegate: UIResponder {
    var window: UIWindow?
}

// MARK: - UIWindowSceneDelegate

extension SceneDelegate: UIWindowSceneDelegate {
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let _window = UIWindow(windowScene: windowScene)
        
        _window.rootViewController = UINavigationController(rootViewController: ViewController())
        _window.makeKeyAndVisible()
        
        self.window = _window
    }
}
