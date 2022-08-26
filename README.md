#  README.txt for Sun & Skin App

## Notes/Resources:
- Weather API calls:
    - https://betterprogramming.pub/simple-weather-app-with-swiftui-ac41200a9d4d
    - [GitHub - Weather Forecast App] https://github.com/fabirt/weather-forecast-app
- Dealing with transitions between views:
    - https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-and-remove-views-with-a-transition
    - https://developer.apple.com/forums/thread/667742
    - [How to use Transition in SwiftUI | Bootcamp #27] https://www.youtube.com/watch?v=X6FAIa0nJoA
- Xcode intro:
    - [Beginner Introduction to Xcode 13] https://www.youtube.com/watch?v=vKPCvAPW9Ns
    - [Learn how to use Xcode (Xcode Tutorial, Xcode tutorial for beginners, Getting Started with Xcode)] https://www.youtube.com/watch?v=FcsY1YPBwzQ

## Tomorrow.io API
- Sample code to get the current temperature in Times Square
    ```
    curl --request GET --url \
    'https://api.tomorrow.io/v4/timelines?location=40.7579787,-73.9877313&fields=temperature&fields=weatherCode&units=metric&timesteps=current&apikey=zkNb4AZDup33RXX6OJ236csr85l7TeyQ'
    ```
https://api.tomorrow.io/v4/timelines?location=40.7579787,-73.9877313&fields=temperature&fields=weatherCode&units=metric&timesteps=1h&startTime=2021-12-25T19:36:11Z&endTime=2021-12-25T20:36:11Z&apikey=zkNb4AZDup33RXX6OJ236csr85l7TeyQ
