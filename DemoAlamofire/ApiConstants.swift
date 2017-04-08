//
//  ApiConstants.swift
//  HomeSwapper
//
//  Created by Deepak Pandey on 9/23/15.
//  Copyright © 2015 Neuron Solutions Inc. All rights reserved.
//


//** Base url of web service //
//TODO: Build Changes
//For Live
//let kAPI_BaseURL                       = "http://aardvarkdev.azurewebsites.net/"

//For QA
//let kAPI_BaseURL                         = "https://aardvarkqa.azurewebsites.net/"
let kAPI_BaseURL                         = "https://aardvarkqa.hpdev.co.uk/"
let kAPI_BaseURLIdentityServer           = "https://hpidentityqa.hpdev.co.uk/core/connect/"
let kAPI_BaseURLIdentityServerRegister   = "https://hpidentityqa.hpdev.co.uk/api/"
let kAPI_BaseURLSearchHome               = "https://aardvarkimportandsearchapiqa.azurewebsites.net/api/"
let kAPI_BaseURLRetrieveLocalData        = "https://localinformationqa.azurewebsites.net/"



//QA  - https://aardvarkimportandsearchapiqa.azurewebsites.net/api/search/rent
//UAT  - https://aardvarkimportandsearchapiuat.azurewebsites.net/api/search/rent
//
//LIVE - https://search.hpdev.co.uk/api/search/rent
//let kAPI_BaseURLRetrieveLocalData        = "https://local.homehunt.co.uk/"


//************************** Constant for API Keys **************************//

//** Common Api Constant
let kAPI_Data                           = "data"
let kAPI_Results                        = "results"
let kAPI_PageIndex                      = "pageIndex"
let kAPI_ResultsPerPage                 = "resultsPerPage"
let kAPI_TotalResultsCount              = "totalResultsCount"


let kAPI_DeviceToken                    = "device_token"
let kAPI_ServerDateFormat               = "yyyy-MM-dd'T'HH:mm:ss.SSS"
let kAPI_AppDateFormat                  = "yyyy-MM-dd HH:mm:ss.SSS"

let kAPI_ServerNotificationDateFormat   = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"


//** Api Constant for About
let kAPI_Name                                 = "name"
let kAPI_SendFrom                             = "sendFrom"
let kAPI_Subject                              = "subject"
let kAPI_Body                                 = "body"


//** Api Constant for Authorization
let kAPI_TokenType                      = "token_type"
let kAPI_TokenExpireTime                = "expires_in"
let kAPI_AccessToken                    = "access_token"
let kAPI_Authorization                  = "Authorization"


//** Api Constant for User
let kAPI_User_Id                        = "UserId"
let kAPI_User_Email                     = "email"
let kAPI_User_NickName                  = "u_nick_name"


//** Api Constant for FB Login and Authorization
let kAPI_FBUserBirthDate                      = "birthday"
let kAPI_FBUserFirstName                      = "first_name"
let kAPI_FBUserLastName                       = "last_name"
let kAPI_FBUserGender                         = "gender"
let kAPI_FBUserEmail                          = "email"
let kAPI_FBUserId                             = "id"
let kAPI_FBUserName                           = "UserName"
let kAPI_FBProvider                           = "Provider"
let kAPI_FBAccessToken                        = "AccessToken"
let kAPI_FBName                               = "name"
let kAPI_iSiOSApp                             = "IsIOSApp"
let kAPI_Provider                             = "provider"

//** Api Constant for Login
let kAPI_GrantType                      = "grant_type"
let kAPI_Username                       = "username"
let kAPI_Email                          = "email"
let kAPI_Password                       = "password"
let kAPI_FirstName                      = "FirstName"
let kAPI_LastName                       = "LastName"
let kAPI_RegisteredDeviceToken          = "isRegisteredDeviceToken"
let kAPI_LoginFromFacebook              = "isLoginFromFacebook"
let kAPI_UserNameRegister               = "UserName"
let kAPI_PasswordRegister               = "Password"
let kAPI_ConfirmPasswordRegister        = "ConfirmPassword"


//** Api Constant for Facebook login
let kAPI_FbFirstName                    = "firstname"
let kAPI_FbLastName                     = "lastname"


//** Api Constant for Saved searches
let kAPI_SavedSearches                  = "savedSearches"
let kAPI_AlertFrequencies               = "alertFrequencies"
let kAPI_AlertTypeId                    = "alertTypeId"
let kAPI_AlertTypeText                  = "alertTypeText"
let kAPI_SearchId                       = "searchId"
let kAPI_SearchCriteria                 = "searchCriteria"
let kAPI_SearchName                     = "searchName"
let kAPI_DisplayName                    = "displayName"
let kAPI_Distance                       = "distance"
let kAPI_Features                       = "features"
let kAPI_FeatureGroups                  = "featureGroups"
let kAPI_HomeTypes                      = "homeTypes"
let kAPI_IsRent                         = "isRent"
let kAPI_Keywords                       = "keywords"
let kAPI_Latitude                       = "latitude"
let kAPI_LivingRequirements             = "livingRequirements"
let kAPI_Longitude                      = "longitude"
let kAPI_MaxBeds                        = "maxBeds"
let kAPI_MaxFloor                       = "maxFloor"
let kAPI_MaxPrice                       = "maxPrice"
let kAPI_MinBeds                        = "minBeds"
let kAPI_MinFloor                       = "minFloor"
let kAPI_MinPrice                       = "minPrice"
let kAPI_Postcode                       = "postcode"
let kAPI_SelectedPlaceName              = "selectedPlaceName"
let kAPI_TenancyTypes                   = "tenancyTypes"
let kAPI_TenureTypes                    = "tenureTypes"
let kAPI_Added                          = "added"


//** Api Constant for Saved Homes
let kAPI_SavedHomes                     = "savedHomes"
let kAPI_Id                             = "id"
let kAPI_DateSaved                      = "dateSaved"
let kAPI_IsForSale                      = "isForSale"
let kAPI_PurchasePrice                  = "purchasePrice"
let kAPI_Rent                           = "rent"
let kAPI_RentFrequency                  = "rentFrequency"
let kAPI_MonthlyRent                    = "monthlyRent"
let kAPI_Availability                   = "availability"
let kAPI_HomeTypeName                   = "homeTypeName"
let kAPI_Address                        = "address"
let kAPI_Description                    = "description"
let kAPI_HomeImages                     = "homeImages"
let kAPI_NumberTotalPhotos              = "numberTotalPhotos"
let kAPI_Bedrooms                       = "bedrooms"
let kAPI_IsNative                       = "isNative"
let kAPI_NoLongerAvailable              = "noLongerAvailable"
let kAPI_Saved                          = "saved"
let kAPI_IsSaved                        = "isSaved"
let kAPI_SourceUrl                      = "sourceUrl"
let kAPI_LandlordName                   = "landlordName"
let kAPI_ClosureDate                    = "closureDate"
let kAPI_DisplayPrice                   = "displayPrice"
let kAPI_isHideActiveBids               = "hideActiveBids"
let kAPI_ActiveBids                     = "activeBids"
let kAPI_ClosingDate                    = "closingDate"
let kAPI_StartDate                      = "startDate"
let kAPI_PropertyReference              = "propertyReference"
let kAPI_LettingType                    = "lettingType"
let kAPI_PurchaseType                   = "purchaseType"
let kAPI_LandlordType                   = "landlordType"
let kAPI_Landlord                       = "landlord"
let kAPI_ThirdPartyLandlordName         = "thirdPartyLandlordName"
let kAPI_LandlordInformation            = "landlordInformation"
let kAPI_LandlordLogo                   = "landlordLogo"
let kAPI_ImageCaption                   = "imageCaption"
let kAPI_IsPublished                    = "isPublished"
let kAPI_IsDeleted                      = "isDeleted"
let kAPI_PreviewMode                    = "previewMode"
let kAPI_IsLandlord                     = "isLandlord"
let kAPI_SourceSystemId                 = "sourceSystemId"
let kAPI_SourceSystemReference          = "sourceSystemReference"
let kAPI_SourceSystemUrl                = "sourceSystemUrl"
let kAPI_FloorLevel                     = "floorLevel"
let kAPI_FloorLevelText                 = "floorLevelText"
let kAPI_IsLiftAvailable                = "isLiftAvailable"
let kAPI_LettingDetails                 = "lettingDetails"
let kAPI_Charges                        = "charges"
let kAPI_ChargeTypeName                 = "chargeTypeName"
let kAPI_Amount                         = "amount"
let kAPI_DisplayAmount                  = "displayAmount"
let kAPI_Period                         = "period"
let kAPI_PeriodId                       = "periodId"
let kAPI_Location                       = "location"
let kAPI_Geolocation                    = "geolocation"
let kAPI_SourceSystemName               = "sourceSystemName"


//** Api Constant for Search results
let kAPI_IsValidPlaceSearch             = "validPlaceSearch"
let kAPI_SortOrder                      = "sortOrder"
let kAPI_SelectedPlaceId                = "selectedPlaceId"
let kAPI_Path                           = "path"
let kAPI_Display                        = "display"
let kAPI_TypeName                       = "typeName"
let kAPI_Type                           = "type"
let kAPI_BusinessName                   = "businessName"


//** Api Constant for Contact landlord
let kAPI_Telephone                      = "telephone"
let kAPI_ApplicationAddress             = "applicationAddress"
let kAPI_Apartment                      = "apartment"
let kAPI_HouseName                      = "houseName"
let kAPI_HouseNumber                    = "houseNumber"
let kAPI_Street                         = "street"
let kAPI_Locality                       = "locality"
let kAPI_Town                           = "town"
let kAPI_County                         = "county"
let kAPI_Message                        = "message"
let kAPI_CopySender                     = "copySender"
let kAPI_RequestInformation             = "requestInformation"
let kAPI_RequestViewing                 = "requestViewing"
let kAPI_AdvertTypeId                   = "advertTypeId"
let kAPI_LanllordFirstName              = "firstName"
let kAPI_LanllordLastName               = "lastName"
let kAPI_HomeId                         = "homeId"


//** Api Constant for User defaults
let kAPI_SearchDataBuy                  = "SearchDataBuy"
let kAPI_SearchDataRent                 = "SearchDataRent"
let kAPI_RecentLocations                = "RecentLocations"
let kAPI_SearchLocation                 = "SearchLocation"


//** General API Constant
let kAPI_Key_ID                 = "id"
let kAPI_Key_XRequestedWith     = "X-Requested-With"
let kAPI_XMLHttpRequest         = "XMLHttpRequest"



//**    Result Success |"1"| / Failure |"0"|
let kAPI_Result_Success                            = "1"
let kAPI_Result_Failure                            = "0"

//** Third party frameworks Keys
//let adMobUnitID = "/15188745/HomeSwapper//iOS//320x50"

let adMobUnitID = "/15188745/HomeSwapper//iOS//320x50"

//** Testing Login credential

/*
1)
 //Username  : "test@housingpartners.co.uk",
 //Password  : "abcABC123#",

2)
// Username: scott-test
//Password: AppTeam2015
*/
