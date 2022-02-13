# Amneen 


## Description
Amneen is a security application developed to help find wanted people, track them, and automatically send direct reports to the security authorities the moment they try to enter any hotel.
The application has 3 types of users, the security agencies, hotels and citizens.


**Security authority:** The application enables security authorities to receive reports of wanted people presence in hotels. It also helps the authorities to receive reports of suspicious hotels guests such as drug dealers, smugglers, theafs,...etc.

**Hotels:** The application enhances hotels security by helping security guards to identify and prevent reported people from staying at hotels. It issues a security warning aimed at guarding against unwanted tenants and sends automatic notifications to the city security authorities at the same time. The application also helps hotels security to report suspicious guests.

**Citizens:** The application helps citizens to contact important security authorities directly such as police, red crescent, civil defense, fight against drugs and others.
It also displays the locations of important security stations in the Kingdom of Saudi Arabia.

## User Stories
- #### Hotels can:
- add a new renter information such as name, ID number, room number and date & time of checking in.
- view a renter profile such as name, ID number, room number and date & time of checking in.
- search for any renter in the hotel customers list.
- display automatic security alerts sent to security authorities.
- check out a guest with the time and date of their departure.
- send reports of suspicious guests to the security agencies.
- display previous tenants list and their check in & out time and date.
- show a blacklist of reported people who have been prevented from entering the hotel and save them for security reasons.

#### Security agency can:
- see a list of blacklisted criminals with name, ID number and type of crime.
- receive reports from hotels about criminals, which facilitate tracking them.
- receive reports from citizens about suspicious people.

#### Citizen can:
- display important emergency numbers and contacts.
- find the locations of important security stations in their area and around the kingdom.

## Features
- The application helps to enhance security in general and hotels security in particular.
- It is a link between hotels and the security authorities, which facilitates sending quick reports to the suitable authority.
- it helps the security agencies to track criminals and wanted people.
- It helps citizens to have access of important emergency numbers and security stations locations.
- The application supports both Arabic and English languages.
- It also supports dark and light mode.

# Amneen
| Component | Permissions | Behavior|
| ------ | ------ |------ |
| Register | All users | Registration form which has fields to enter first name, last name, email and password.
| Login | All users | Login form where app users can sign in with their emails and passwords.
| Profile | All users | It displays the user's first and last name, personal photo, and user log out button.
| Settings | All users | The language of the application can be changed and the application appearance can be switched to eiter dark or light mode.
| AppInfoHotel | Hotel only | displaying user guidlines for hotels.
| AppInfoSecurity | Security Agency only | displaying user guidlines for security agencies.
| AppInfoUser | User only | displaying user guidlines for citizens.
| TabViewController | User only | It contains the profile screen, settings screen, application information screen, important emergency numbers screen, and important sites screen.
| CentersLocations | User only | The sites of important security stations are displayed.
| SOS numbers | User only | Important emergency numbers are shown and how to directly contact them.
| SecurityContainer | Security Agency only | It contains the profile screen, settings screen, application information screen, reports screen, and suspicious people reports screen.
| Blacklist | Security Agency only | A list of criminals blacklist is displayed.
| Reports | Security Agency only | Hotels reports of wanted or suspicious guests.
| ReportRenters | Security Agency only | Receiving reports of suspicious people, such as drug smugglers or theifs,...etc.
| Cities | Hotel only | The main cities of Saudi Arabia are displayed with thier hotels names.
| Hotels | Hotel only | City hotels are displayed with their list of guests.
| Renters | Hotel only | It displays a tenant details and the date & time of entry.
| NewRenter | Hotel only | Adding a new renter etails.
| Renter | Hotel only | Displaying renter details.
| Leaving Renters | Hotel only | It shows the previous renters details and the check in and out details.
| Banned Renters | Hotel only | It diplays a list of people banned from entering a hotel and the reason of ban.
| HotelContainer | Hotel only | It contains the settings screen, the home page, the screen of adding new renters, existing renters, previous renters, and banned renters.
## Access Primssions :
 - For security Agency:   
  *Email:* securityagency@moi.gov.sa   
  *Password:* 123456
 
 - For Hotel:   
 *Email:* alsrawat@hotel.com             
 *Password:* 123456   
 
 - For other users:   
 Please register with your *email* and *password*.
 
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

