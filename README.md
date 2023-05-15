# Raw Games

A Flutter application that can run on Android and iOS, utilizing the API from [RAWG Video Games Database API](https://api.rawg.io/docs/).
The app displays all games from various platforms with an up-to-date database.

## Overview

- [Raw Games](#raw-games)
  - [Overview](#overview)
    - [Developed Using](#developed-using)
  - [Getting Started](#getting-started)
    - [Prerequisite](#prerequisite)
    - [Installation](#installation)
    - [Run Project](#run-project)
  - [Contact](#contact)

### Developed Using

This project was developed by utilizing several tools and software.

- Flutter 3.7.11 with Dart SDK 2.19.6
- Android Studio
- XCode (Optional only if you only want the Android version)
- Postman (Optional only if you need a deeper exploration of the schema and specifications of the RAWG API)

## Getting Started

### Prerequisite

- Have [Flutter & Dart SDK](https://docs.flutter.dev/get-started/install) installed on your machine
  - I recommend using the same version with which used for develop this project (Flutter 3.7.11 with Dart SDK 2.19.6)
  - If you cannot change your version of Flutter for any reason you can give this tool a try, [Flutter Version Management](https://fvm.app/)

- Have an IDE (I recommend Android Studio or Visual Studio Code)

### Installation

Without further ado let's run it on your local machine!

1. Clone repository

    ```bash
    git clone https://github.com/rizkyagungramadhan/raw_games.git
    ```
    

2. Switch to development branch

    ```bash
    git checkout development
    ```


3. Fetch all library & reproduce the generated files (choose option that is more suitable for you)
   
   - I prepared a script for simplify this process in `script/init.sh`, you can run this by running it on your CLI

        ```bash
        # change directory to this root project folder and run
        bash script/init.sh
        ```
   - Run one by one

        ```bash
        # get all library dependencies
        flutter pub get
        ```
        ```bash
        # reproduce generated files & mock files which used for unit test
        flutter pub run build_runner build --delete-conflicting-outputs
        ```


### Run Project

Make sure you have real device connected into your machine or opened emulator/simulator.
This project has two flavor, `prod` for production & `stg` means for staging, you can choose which version you want to by running this command :

```bash
# for staging flavor
flutter run --flavor stg
```
```bash
 # for production flavor
flutter run --flavor prod
```

## Contact

Facing a problem? Don't be a stranger!
If you're lost and can't find your way around this project, don't worry, it happens to the best of us!
Just drop me a line at my email [rizkyagungramadhan@gmail.com](mailto:rizkyagungramadhan@gmail.com). Thank you (:
