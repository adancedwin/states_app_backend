# The task
We have two entities User and Vehicle (main model). The app needs to implement some API functionality.

The following needs to be accessible through API:
- Authentication for User 
- Authorization for User
- Creation a new Vehicle
- Listing a single Vehicle
- Listing all Vehicles
- Changing a Vehicle's state
- Deleting a Vehicle

# Setup
### 1. Versions
Make sure you have the latest stable ruby version which is currently for this project - 3.0.2 version.

As a persistent storage the project uses Postgres database, make sure you have version 9.3 or later.

### 2. Bundle up
Go to the project's directory in your command line `bundle install` or simply `bundle`.

# Launch the project
### 1. Database setup
Find database.yml and configure it to your own Postgres database.

Then run:
```
bundle exec rails db:create && bundle exec rails db:migrate
```

### 2. Launch the app
Launch Rails app:
```
bundle exec rails s
```


Run unit tests:
```
bundle exec rspec
```

# How to use API
To send requests to API you can use Postman's desktop app. The payload should be of JSON format.

The default address would start with `http://localhost:3000/`

##**API endpoints**

### 1. Logging in
**Endpoint info**

Method | Path
------------ | -------------
POST | /api/login

**Parameters**

Parameter | Type | Required?
------------ | ------------- | -------------
email | string | yes
password | string | yes

JSON body example:
```
{
  "email": "email@example.com",
  "password": "password"
}
```

### 2. Listing a Vehicle
**Endpoint info**

Method | Path
------------ | -------------
GET | api/v1/vehicles/:id

**Parameters**

Parameter | Type | Required?
------------ | ------------- | -------------
id | integer | yes (included in a path)

### 3. Changing Vehicle state
**Endpoint info**

Method | Path
------------ | -------------
POST | api/v1/vehicles/:id/change_state

**Parameters**

Parameter | Type | Required?
------------ | ------------- | -------------
id | string | yes (included in a path)
vehicle | object | yes
new_state_index | integer | yes

JSON body example:
```
{
  "vehicle": { "new_state_index": 3 }
}
```

### 4. Creating a Vehicle
NOTE: needs admin rights.

**Endpoint info**

Method | Path
------------ | -------------
POST | api/v1/admin/vehicles

Parameter | Type | Required?
------------ | ------------- | -------------
vehicle | object | yes
name | string | no
states_data | array[string] | yes

JSON body example:
```
{
  "vehicle": { "name": "name", states_data: ["D", "A", "T", "P"] }
}
```

### 5. Updating a Vehicle
NOTE: needs admin rights.

**Endpoint info**

Method | Path
------------ | -------------
POST | api/v1/admin/vehicles/:id

Parameter | Type | Required?
------------ | ------------- | -------------
id | string | yes (included in a path)
vehicle | object | yes
states_data | array[string] | yes
current_state_index | integer | yes

JSON body example:
```
{
  "vehicle": { states_data: ["D", "A", "T", "P"], current_state_index: 2 }
}
```

### 6. Listing all Vehicles
NOTE: needs admin rights.

**Endpoint info**

Method | Path
------------ | -------------
POST | api/v1/admin/vehicles

### 7. Deleting a Vehicle
NOTE: needs admin rights.

**Endpoint info**

Method | Path
------------ | -------------
POST | api/v1/admin/vehicles/:id/delete

Parameter | Type | Required?
------------ | ------------- | -------------
id | string | yes (included in a path)
