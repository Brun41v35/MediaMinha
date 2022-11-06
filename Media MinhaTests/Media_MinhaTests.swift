import XCTest
import UIKit
@testable import Media_Minha

final class Media_MinhaTests: XCTestCase {
    
    private let calculateSpy = CalculateConfiguratorProtocolSpy()
    private lazy var navigationControllerSpy = NavigationControllerSpy(rootViewController: sut)
    private lazy var sut: UserNameViewController = {
        let viewController = UserNameViewController(configurator: calculateSpy)
        
        return viewController
    }()
    
    func test_bla() {
        sut.callCalculateGradeScreen()
        
        XCTAssertTrue(calculateSpy.makeCalled)
        XCTAssertTrue(navigationControllerSpy.pushCalled)
        XCTAssertNotNil(navigationControllerSpy.viewControllerPassed)
        XCTAssertTrue(navigationControllerSpy.animatedPassed == true)
    }
    
}

final class CalculateConfiguratorProtocolSpy: CalculteGradeConfiguratorProtocol {
    
    private(set) var makeCalled: Bool = false
    
    func make() -> UIViewController {
        makeCalled = true
        
        return UIViewController()
    }
}

final class NavigationControllerSpy: UINavigationController {
    
    private(set) var pushCalled: Bool = false
    private(set) var viewControllerPassed: UIViewController?
    private(set) var animatedPassed: Bool?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushCalled = true
        viewControllerPassed = viewController
        animatedPassed = animated
    }
}


