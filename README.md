# EKTabBarController

![Swift 5.6+](https://img.shields.io/badge/Swift-5.6%2B-orange.svg)
![Xcode 13.4+](https://img.shields.io/badge/Xcode-13.4%2B-blue.svg)
![iOS 13.0+](https://img.shields.io/badge/iOS-13.0%2B-blue.svg)
[![Telegram: @emvakar](http://img.shields.io/badge/telegram-%40emvakar-70a1fb.svg?style=flat)](https://t.me/emvakar)
[![Linkedin: emvakar](http://img.shields.io/badge/linkedin-emvakar-70a1fb.svg?style=flat)](https://www.linkedin.com/in/emvakar)
[![Twitter: @emvakar](http://img.shields.io/badge/twitter-%40emvakar-70a1fb.svg?style=flat)](https://twitter.com/emvakar)
![License](https://img.shields.io/cocoapods/l/Hero.svg?style=flat)


## Installation 📱

Just add `https://github.com/emvakar/EKTabBar.git` to your Package.swift or Xcode project. Done!

## Usage ✨ 

### Step 1

Importing framework

```swift
import EKTabBarController
```
### Step 2

Somewhere in your code, create items

```swift
let item1 = EKControllerItem(tabBarButtonItem: UITabBarItem(...), viewController: UIViewController())
let item2 = EKControllerItem(tabBarButtonItem: UITabBarItem(...), viewController: UIViewController())
```
### Step 3

Init TabBar controller

```swift
let tabBarController = EKTabBarController(controllerItems: [item1, item2], cornerRadius: 20, backgroundColor: .green)
```
### Step 4

Show it ;)

```swift
self.present(tabBarController, animated: true)
```

## Requirements

* Xcode 13.4+
* Swift 5.6
* iOS 13+

## License

This project is under MIT license. For more information, see `LICENSE` file.

## Credits 

It will be updated when necessary and fixes will be done as soon as discovered to keep it up to date.

You can find me on Telegram [@emvakar](https://t.me/emvakar) or Twitter [@emvakar](https://twitter.com/emvakar) or Linkedin [emkarimov](https://www.linkedin.com/in/emvakar).

Enjoy! 🤓
