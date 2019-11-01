import XCTest
@testable import Nodes

final class NodesTests: XCTestCase {
    func testTree() {
        let root = SimpleNode(value: "Apple")
        
        let desktops = SimpleNode(value: "Desktops")
        root.addChild(node: desktops)
        
        let macPro = SimpleNode(value: "Mac Pro")
        desktops.addChild(node: macPro)
        
        let macMini = SimpleNode(value: "Mac Mini")
        desktops.addChild(node: macMini)
        
        let iMac = SimpleNode(value: "iMac")
        desktops.addChild(node: iMac)
        
        let notebooks = SimpleNode(value: "Notebooks")
        root.addChild(node: notebooks)
        
        let macBookPro = SimpleNode(value: "MacBook Pro")
        notebooks.addChild(node: macBookPro)
        
        let devices = SimpleNode(value: "Devices")
        root.addChild(node: devices)
        
        let handhelds = SimpleNode(value: "Handhelds")
        devices.addChild(node: handhelds)
        
        let ipod = SimpleNode(value: "iPod")
        handhelds.addChild(node: ipod)
        
        let iphone = SimpleNode(value: "iPhone")
        handhelds.addChild(node: iphone)
        
        let newton = SimpleNode(value: "Newton")
        handhelds.addChild(node: newton)
        
        let setTopBoxes = SimpleNode(value: "Set-top boxes")
        devices.addChild(node: setTopBoxes)
        
        let appleTV = SimpleNode(value: "Apple TV")
        setTopBoxes.addChild(node: appleTV)
        
        let ipodHiFi = SimpleNode(value: "iPod HiFi")
        devices.addChild(node: ipodHiFi)
        
        XCTAssertEqual(ipod.siblings, [iphone, newton])
        XCTAssertEqual(ipod.siblingsIncludingSelf, [ipod, iphone, newton])
        XCTAssertEqual(root.siblingsIncludingSelf, [])
        XCTAssertEqual(appleTV.ancestors, [setTopBoxes, devices, root])
        XCTAssertEqual(iphone.ancestorsIncludingSelf, [iphone, handhelds, devices, root])
        XCTAssertTrue(newton.isLeaf)
        XCTAssertEqual(devices.leaves, [ipodHiFi])
        XCTAssertEqual(devices.breadth, 1)
        XCTAssertTrue(devices.isBranch)
        XCTAssertEqual(devices.branches, [handhelds, setTopBoxes])
        XCTAssertFalse(macBookPro.isBranch)
        XCTAssertEqual(root.depth, 0)
        XCTAssertEqual(root.level, 1)
        XCTAssertEqual(appleTV.depth, 3)
        XCTAssertEqual(appleTV.level, 4)
        XCTAssertTrue(root.isRoot)
        XCTAssertFalse(newton.isRoot)
        XCTAssertEqual(newton.root, root)
        XCTAssertEqual(root.root, root)
        XCTAssertEqual(root.degree, 3)
        XCTAssertEqual(root.descendants.sorted { $0.value < $1.value }, [desktops, macPro, macMini, iMac, notebooks, macBookPro, devices, handhelds, ipod, iphone, newton, setTopBoxes, appleTV, ipodHiFi].sorted { $0.value < $1.value })
        XCTAssertEqual(ipodHiFi.description, "iPod HiFi")
        
        let treeRepresentation = """
        Apple
        ├── Desktops
        │   ├── Mac Pro
        │   ├── Mac Mini
        │   └── iMac
        ├── Notebooks
        │   └── MacBook Pro
        └── Devices
            ├── Handhelds
            │   ├── iPod
            │   ├── iPhone
            │   └── Newton
            ├── Set-top boxes
            │   └── Apple TV
            └── iPod HiFi

        """
        
        XCTAssertEqual(root.lineBasedDescription, treeRepresentation)
    }

    static var allTests = [
        ("testTree", testTree),
    ]
}
