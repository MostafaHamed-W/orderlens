# OrderLens 

Order Insights is a Flutter application designed to display e-commerce order metrics. It supports **iOS**, **Android**, and **Web** platforms, offering a seamless user experience.

## Features

1. **Metrics Screen**: Displays numerical insights about the orders like Total count, Average priceand Number of returned orders.
2. **Graph Screen**: Visualizes the number of orders over time using an interactive line chart and orders per each month.
3. **Refreshable Data**: Users can manually refresh the displayed data.
4. **Responsive Design**: Optimized for iOS, android and web.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Compatible IDE: VS Code, IntelliJ, or Android Studio
- A device/emulator for testing (iOS, Android).

## Instructions to run the project
1. Clone the repository:
   ```bash
   git clone https://github.com/MostafaHamed-W/orderlens
   cd orderlens

2. Install dependencies:
   ```bash
   flutter pub get
3. Generate Code:


   Since the app uses json_serializable and freezed, generate the necessary files by running:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs

4. Run the application:
   ```bash
   flutter run

## **Screenshots**
<p>
<img src="https://github.com/user-attachments/assets/c5c91bfd-30aa-437d-b2c8-80c1566d1601" alt="Splash View" width="300">
<img src="https://github.com/user-attachments/assets/ea1ad768-f14e-42a5-97cc-f347ece078ca" width="300">
<img src="https://github.com/user-attachments/assets/f5fff0df-4f0e-4051-a44f-1a7e700feb26" width="300">
<img src="https://github.com/user-attachments/assets/90696a50-7732-4809-8b6b-d1c5f23babfb" width="300">
<img src="https://github.com/user-attachments/assets/74956555-d38e-43b0-b03f-002978054b82" width="300">
</p>

## **Tech Stack**

- **State Management**: flutter_bloc, Cubit 
- **Code Generation**: freezed, freezed_annotation, json_annotation, json_serializable, build_runner  
- **Dependency Injection (DI)**: get_it  
- **DateTime**: intl  
- **UI**:flutter_screenutil, animations, percent_indicator, fl_chart  

## **Folder Structure**
<img src="https://github.com/user-attachments/assets/a0b5f696-e0e8-4465-ad4c-0fbfbb0a0280" width="600">

## Concept Design (Wireframe)
<img src="https://github.com/user-attachments/assets/75aa111e-0c25-4fa6-b925-0b8df3215f10" width="600">


## Walkthrough Video
[Click here to watch the walkthrough video](https://drive.google.com/file/d/1l_fbr8Wzdqks2Zh3uxZtZzIucmbUSInm/view?usp=sharing)

