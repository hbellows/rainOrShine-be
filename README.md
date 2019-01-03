# Sweater Weather
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
![alt text](https://img.shields.io/badge/ruby-2.4.0-red.svg "Ruby")
![alt text](https://img.shields.io/badge/rails-5.1.6-red.svg "Ruby on Rails")
[![Build Status](https://travis-ci.org/hbellows/rain_or_shine.svg?branch=master)](https://travis-ci.org/hbellows/rain_or_shine)
[![Test Coverage](https://img.shields.io/badge/coverage-100%25-green.svg)](https://codecov.io/gh/hbellows/rain_or_shine)

## Purpose

This is a back-end API endpoint application that will power a separate front-end application. It retrieves current, hourly, and daily weather from the Dark Sky API, using coordinates generated from a user inputted location gathered from the Google Geocoder API. This application also has the ability to hit the Flickr photo API to display a location-based image.

## System Requirements

 - Ruby >= 2.4.0
 - Rails >= 5.1.6
 - Your own Google API key
 - Your own Dark Sky API key

## Setup

1. Clone or fork this project to your local machine.
2. Run `bundle` in the project folder.
3. Run `figaro install` in the project folder.
4. Add the following API keys to config/application.yml with the variable names exactly as shown:
   - `GOOGLE_API_KEY`
   - `DARK_SKY_API_KEY`
5. Run `rails db:{create,migrate}` in the project folder.
6. Run `rspec` to run the full test suite, or `rails server` to load up the application.


# README

Sweater Weather Project
1. Weather for a City
The functionality for this page should be split into multiple user stories.
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
Response:

There is room for personal preference for this response body. Use the mock ups to see what data is required on the front end to decide what you would like to include in your response. If you’d like more of a challenge, you might consider using Fast JSON API and consider trying to stick to the JSON 1.0 spec.

Requirements:

  - Needs to pull out the city and state from the GET request and send it to Google’s Geocoding API to retrieve the lat and long for the city (this can be it’s own story)
  - Retrieve forecast data from the Darksky API using the lat and long
 

2. Account Creation
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json
```
```
{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}
```
Response:

  status: 201
  
body:
```
{
  "api_key": "jgn983hy48thw9begh98h4539h4",
}
```

3. Login
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
```
```
{
  "email": "whatever@example.com",
  "password": "password"
}
```
Response:

  status: 200
  
body:
```
{
  "api_key": "jgn983hy48thw9begh98h4539h4",
}
```

4. Favoriting Locations
```
POST /api/v1/favorites
Content-Type: application/json
Accept: application/json
```
body:
```
{
  "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
Requirements:

  - API key must be sent
  - If no API key or an incorrect key is provided return 401 (Unauthorized)
  
5. Listing Favorite Locations
```
GET /api/v1/favorites
Content-Type: application/json
Accept: application/json
```
body:
```
{
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Requirements:

  - API key must be sent
  - If no API key or an incorrect key is provided return 401 (Unauthorized)

Response:

  status: 200
  
body:
```
[
  {
    "location": "Denver, CO",
    "current_weather": {
      # This can vary but try to keep it consistent with the
      # structure of the response from the /forecast endpoint
    },
    "location": "Golden, CO",
    "current_weather": {
       {...}
    }
  }
]
```

6. Removing Favorite Locations
```
DELETE /api/v1/favorites
Content-Type: application/json
Accept: application/json
```
body:
```
{
  "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Requirements:

  - API key must be sent
  - If no API key or an incorrect key is provided return 401 (Unauthorized)
  
Response:

  status: 200
  
body:
```
[
  {
    "location": "Denver, CO",
    "current_weather": {
      # This can vary but try to keep it consistent with the
      # structure of the response from the /forecast endpoint
    },
    "location": "Golden, CO",
    "current_weather": {
       {...}
    }
  }
]
```
