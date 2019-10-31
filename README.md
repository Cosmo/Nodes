# Nodes

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
```

```swift
print(root.lineBasedDescription)

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


