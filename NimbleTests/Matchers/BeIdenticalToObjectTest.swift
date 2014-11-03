import XCTest
import Nimble

class BeIdenticalToObjectTest:XCTestCase {
    private class BeIdenticalToObjectTester {}
    private let testObjectA = BeIdenticalToObjectTester()
    private let testObjectB = BeIdenticalToObjectTester()

    func testBeIdenticalToPositive() {
        expect(testObjectA).to(beIdenticalTo(testObjectA))
    }
    
    func testBeIdenticalToNegative() {
        expect(testObjectA).toNot(beIdenticalTo(testObjectB))
    }
    
    func testBeIdenticalToPositiveMessage() {
        let message = NSString(format: "expected to be identical to <%p>, got <%p>",
            unsafeBitCast(testObjectB, Int.self), unsafeBitCast(testObjectA, Int.self))
        failsWithErrorMessage(message) {
            expect(self.testObjectA).to(beIdenticalTo(self.testObjectB))
        }
    }
    
    func testBeIdenticalToNegativeMessage() {
        let message = NSString(format: "expected to not be identical to <%p>, got <%p>",
            unsafeBitCast(testObjectA, Int.self), unsafeBitCast(testObjectA, Int.self))
        failsWithErrorMessage(message) {
            expect(self.testObjectA).toNot(beIdenticalTo(self.testObjectA))
        }
    }
    
    func testOperators() {
        expect(testObjectA) === testObjectA
        expect(testObjectA) !== testObjectB
    }

}
