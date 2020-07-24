# trz
Leonardo de Sena Cunha


## Getting Started

1 - Open your Virtual Device

2 - flutter pub get

3 - flutter run

## Dependencies

User need to activate GPS and allow APP to access GPS data.

## APP Flow
Splash Screen: Introduction of APP

![](https://github.com/leosena/challenge/blob/master/Screens/splash.PNG)


Register Screen: Here user register with his name, age and gender.

- User must follow some Name pattern, Age between 1-99 and gender 'M' or 'F' to proceed.

![](https://github.com/leosena/challenge/blob/master/Screens/register.PNG)

Item Choose Screen: User select your items on bag

- Not implemented item choose limit
- Post on API new survivor with all information

![](https://github.com/leosena/challenge/blob/master/Screens/itemsScreen.PNG)

Main User Screen:

- If user is registered already, APP initiates on this screen.
- Update GeoLocation of user
- Show position on Maps (Google Maps API)
- Navigation to (Add User Functionality)
- Navigation to (List of friends)

![](https://github.com/leosena/challenge/blob/master/Screens/mainuserscreen.PNG)

Add Friend Screen:

- Add on a local storage a list of Survivor ID's (friends)

![](https://github.com/leosena/challenge/blob/master/Screens/addsurv2.PNG)


List Friends Screen:

- List of friends
- Show if survivor is infected
- Trade Funcionality (not implemented - returning true)
- Report as infected

![](https://github.com/leosena/challenge/blob/master/Screens/friendlist_normal.PNG)
![](https://github.com/leosena/challenge/blob/master/Screens/friendlist_infected.PNG)
![](https://github.com/leosena/challenge/blob/master/Screens/friendlist_infected_trade.PNG)
![](https://github.com/leosena/challenge/blob/master/Screens/friendlist_report.PNG)


Trade Screen:

- Select your items and other survivor's and make the trade!

![](https://github.com/leosena/challenge/blob/master/Screens/trade.PNG)




