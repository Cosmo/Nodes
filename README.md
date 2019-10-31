# Nodes

Nodes provides a generic tree data structure with support of multiple children. Written in Swift.

## Usage

Create a new `Node` with `init(value: T)` :

```
let root = Node(value: "Hand")
```

Add children with `addChild(node: Node)`:

```
root.addChild(node: Node(value: "Thumb"))
root.addChild(node: Node(value: "Index finger"))
root.addChild(node: Node(value: "Middle finger"))
root.addChild(node: Node(value: "Ring finger"))
root.addChild(node: Node(value: "Little finger"))
```

Print tree to console:

```
print(root.lineBasedDescription)
```

Result:

```
Hand
├── Thumb
├── Index finger
├── Middle finger
├── Ring finger
└── Little finger
```

## Features

### Ancestors

```swift
/// Returns all parent nodes.
public var ancestors: [Node]
```

```swift
/// Returns all parent nodes, including the current node.
public var ancestorsIncludingSelf: [Node]
```

```swift
/// A Boolean value indicating whether the current node is the top node.
public var isRoot: Bool
```

```swift
/// Returns the top node.
public var root: Node
```

### Descendants

```swift
/// Adds a sub-node.
public func addChild(node: Node)
```

```swift
/// Returns the number of children.
public var degree: Int
```

```swift
/// Returns all descendants, traversing the entire tree.
public var descendants: [Node]
```

### Leaves

```swift
/// A Boolean value indicating whether the node is without children.
public var isLeaf: Bool
```

```swift
/// Returns all nodes with no children.
public var leaves: [Node]
```

```swift
/// Returns the number of leaves.
public var breadth: Int
```

### Branches

```swift
/// A Boolean value indicating whether the node has children.
public var isBranch: Bool
```

```swift
/// Returns all nodes with at least one child.
public var branches: [Node]
```

### Siblings

```swift
/// Returns all other nodes with the same parent.
public var siblings: [Node]
```

```swift
/// Returns all nodes (including the current node) with the same parent.
public var siblingsIncludingSelf: [Node]
```

### Position

```swift
/// Returns the distance between a node and the root.
public var depth: Int
```

```swift
/// The number of edges between the current node and the root.
public var level: Int
```

### Textual representation

```swift
public var lineBasedDescription: String
```


## Example

```swift
let root = Node(value: "Apple")

let desktops = Node(value: "Desktops")
root.addChild(node: desktops)

let macPro = Node(value: "Mac Pro")
desktops.addChild(node: macPro)

let macMini = Node(value: "Mac Mini")
desktops.addChild(node: macMini)

let iMac = Node(value: "iMac")
desktops.addChild(node: iMac)

let notebooks = Node(value: "Notebooks")
root.addChild(node: notebooks)

let macBookPro = Node(value: "MacBook Pro")
notebooks.addChild(node: macBookPro)

let devices = Node(value: "Devices")
root.addChild(node: devices)

let handhelds = Node(value: "Handhelds")
devices.addChild(node: handhelds)

let ipod = Node(value: "iPod")
handhelds.addChild(node: ipod)

let iphone = Node(value: "iPhone")
handhelds.addChild(node: iphone)

let newton = Node(value: "Newton")
handhelds.addChild(node: newton)

let setTopBoxes = Node(value: "Set-top boxes")
devices.addChild(node: setTopBoxes)

let appleTV = Node(value: "Apple TV")
setTopBoxes.addChild(node: appleTV)


print(root.lineBasedDescription)
```

Output:

```
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
└── Set-top boxes
└── Apple TV
```
