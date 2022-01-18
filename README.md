# Amneen 


## Description
It is a security application that aims to find wanted persons, obtain information to track them, and automatically send direct reports to the security authorities when they try to enter any hotel.
The application has 3 types of users:
Users: the security agency, hotels, citizens


The security authority: the application enables the security authority to receive reports of the presence of wanted persons in hotels, and these automatic reports help in tracking the wanted persons, and the security authority also receives reports of suspicion of one of the hotel’s renters such as drug smuggling and others ....

Hotels: The application helps to enhance the security of hotels. When a security-requested renter comes or has a report, the hotel will show a security warning aimed at guarding against him and not entering the hotel to maintain its security, and also a notification will be sent automatically to the security authority at the same time.
The hotel also has the possibility to send a report of suspicion of one of the renters to the security authority, such as drug smuggling or others..

Citizen: The application helps the citizen to communicate directly with the important security authorities such as the police, the Red Crescent, the civil defense, the fight against drugs.....etc.
It also displays the locations of the important security centers in the Kingdom of Saudi Arabia.

## User Stories
- As a hotel, I can view the information of the renters name, ID number, date and time of entering the hotel, hotel name and suite number.
- As a hotel, I can add a new renter, name, ID number, date and time of entering the hotel.
- As a hotel, I can search for any renter in the list of renters.
- As a hotel, when a new renter is entered and if they are blacklisted, a security alert will be displayed and an automatic notification will be sent to the security agency and the hotel can contact the security agency directly.
As a hotel, I can check out any renter with the time and date of departure.
- As a hotel, I can send reports of suspicious renters to the security agency, such as suspected drug smuggling or theft ... etc.
- As a hotel, I can see a list of the previous renters, the time they entered the hotel and the time they left.
As a hotel, I can see the renters who were prevented from entering the hotel on today's date and because of the ban, and save them for reference for security reasons.

- As a security agency, I can see a list of blacklisted criminals with name, ID number and type of crime.

- As a security agency, I can get reports of criminals that facilitate tracking of the criminal.
- As a security agency, I can get suspicious reports of renters coming from hotels, such as suspected drug smuggling or theft...etc.
- As a Citizen (Citizen) user, I can get important emergency numbers and contact them directly.
- As a Citizen user, I can see the locations of the important emergency centers in my area.

# Features
It helps to enhance security in general and to enhance security in hotels in particular.
It is considered a link between the hotels and the security agency, making it easy to send quick reports and suspicious reports.
Helps the security agency to track criminals.
It helps the citizen to quickly access important emergency numbers and contact directly.

The application supports Arabic and English languages.
The application supports dark and lite mode.
# Amneen
| Component | Permissions | Behavior|
| ------ | ------ |------ |
| Register | All users | Registration form, fields to enter the first name, last name, email and password.
| Login | All users | Login form, fields for entering email and password.
| Profile | All users | It displays the user's first and last name, personal photo, and the user's ability to log out through it.
| Settings | All users | The language of the application is changed and the appearance of the application is changed to night mode or light mode.
| AppInfoHotel | Hotel only | An explanation of the use of the application and information about the hotel application are displayed.
| AppInfoSecurity | Security Agency only | An explanation of the use of the application and information about the application of the security agency is displayed.
| AppInfoUser | User only | An explanation of the use of the application and information about the application for the user (citizen) is displayed.
| TabViewController | User only | It contains the profile screen, settings screen, application information screen, important emergency numbers screen, and important sites screen.
| CentersLocations | User only | The sites of the important security centers are displayed.
| SOS numbers | User only | Important emergency numbers are displayed and the ability to contact them directly.
| SecurityContainer | Security Agency only | It contains the profile screen, settings screen, application information screen, reports screen, and suspicious reports screen.
| Blacklist | Security Agency only | A list of criminals in the blacklist is displayed.
| Reports | Security Agency only | It receives reports of criminals tracking coming from hotels.
| ReportRenters | Security Agency only | It receives reports of suspicions of stalactites, such as drug smuggling or theft, and others, coming from hotels.
| Cities | Hotel only | The cities of the Kingdom of Saudi Arabia are displayed, and each city has its own hotels.
| Hotels | Hotel only | The hotels for each city and the renters for each hotel are displayed.
| Renters | Hotel only | It displays the information of the renters, the name and ID number, the date of entry, and the time of entry.
| NewRenter | Hotel only | Through it, a new renter is added, where the renter's name, ID number, and the date and time of entering the hotel are entered.
| Renter | Hotel only | Where the renter information is displayed.
| Leaving Renters | Hotel only | It displays the previous renters, name, ID number, the date of entering the hotel and the date of leaving the hotel.
| Banned Renters | Hotel only | In it, a list of people who were prevented from entering the hotel and the reason for the ban is displayed.
| HotelContainer | Hotel only | It contains the settings screen, the home page, the screen for adding new renters, existing renters, departing renters, and prohibited renters from entering.
## Access Primssions :
 -For Sequrity Agency:   email: securityagency@moi.gov.sa       password: 123456
 
 -For Hotel:   email: alsrawat@hotel.com              password: 123456          
  -For Other users :   your email.
## Models:
- City
- Hotel
- Renter
- BlackList
- SOSNumbers
- LeavingRenter
- Report
- ReportRenter



## ViewModel
- Login&RegisterViewModel
- ColorViewModel
- GradientViewModel


## Views(Controllers):
- Cities
- Hotels 
- TabViewController
- Profile
- Settings
- AppInfoHotel
- AppInfoSequrity
- AppInfoUser
- BlackList
- Reports
- Reports
- ReportRenters
- Renters
- NewRenter
- RenterInfo
- LeavingRenters
- BannedRenters
- HotelContainer
- HotelHome
- HotelMenu
- SecurityContainer
- SecurityHome
- SecurityMenu
- Register
- LogIn
- CentersLocations
- SOSNumbers

## Services:

- CriminalService
- ReportService
- ReportRenterService
- RenterService
- LeavingService


## Localizable:
- Localizable(English)
- Localizable(Arabic)

## Links

## GitHub Rebo
https://github.com/JawaherHassan2/Amneen

## Slides :
https://docs.google.com/presentation/d/1NNRo4hWX5JntOHVrVIUONIenleG7QaVrE13w3vU07B0/edit#slide=id.p8
## My presentation:
