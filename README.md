# README

## Identification Of Issue:

This marketplace was created to allow for faster access to a wide range of Japanese car parts within Australia. There are a large amount of car parts manufacturer websites, and if you want parts from all different websites/manufacturers there is a lot of ordering and shipping fees that apply for the parts.



## Why Is It  A Problem That Needs To Be Solved?

It is a problem that needs to be sold because there are a large number of car parts manufacturers in Australia and world wide, and all of these manufacturers have different websites with many different products. If a customer wants parts from different manufacturers they will have to order many parts from many different website which will cause a lot of hassle as it all the important details are all over the place on different websites. This is why Aus JDM Parts was created to allow a market place where all brands and parts come together to allow for a better user experience and ease of information about orders.



## Website URL

https://ausjdmparts.herokuapp.com/



## Github Repository

https://github.com/Disdroido/Aus-JDM-Parts



## Description Of Marketplace

### Purpose

The purpose of Aus JDM Parts is to allow a market place for all parts correlating to Japanese cars in Australia. 

### Features

The features of the website include:

- Listing create, edit and delete
- Image uploading for listing to aws
- Role creation
- Category creation
- Admin panel for admin tasks
- User sign up and sign in
- Profile page where profile can be updated
- Stripe user creation on sign up
- Stripe purchasing (still being implemented)
- Search feature for listings

### Screenshots

#### Home Page

![Home page screenshot](C:\Users\ethan\Documents\EthanWorth_T2A2\docs\home page.PNG)

####  Listings Page

![Listings page](C:\Users\ethan\Documents\EthanWorth_T2A2\docs\listings page.PNG)

#### Sign In Page

![Sign in page](C:\Users\ethan\Documents\EthanWorth_T2A2\docs\sign in page.PNG)

#### Sign Up Page

![Sign up page](C:\Users\ethan\Documents\EthanWorth_T2A2\docs\sign up page.PNG)

### Target Audience

The target audience are people who have Japanese cars in Australia. The people that would go on the website would be people wishing to modify their cars for more power and or aesthetics.

#### Techstack

- HTML 5
- CSS 3
- Ruby 6
- jQuery 3
- Tailwindcss
- Amazon aws S3
- Heroku



## User Stories

As a potential user, I want to be able to read what the website is about on the home page so that I can gain an understanding of the website.

As a default user, I want to be able to sign up or sign in so that I can gain access to Aus JDM Parts.

As a default user, I want to be able to buy a listed product for my vehicle.

As an admin user, I want to be able to have control of the website so that I can mange listings and users.



## ERD

### First ERD

![First ERD](C:\Users\ethan\Documents\EthanWorth_T2A2\docs\erd.png)

### Second ERD



## Difference Between High Level Components

The high level components of the app are:

- The devise user components as it allows for users to be created and a stripe user id to be created after the user is added to the database.
- The listings component as after added to the database are created on stripe to allow for a stripe product.
- The admin dashboard component as it allows the admin to add, edit, view and delete and type of data and table column on the website



## Third Party Services

The third party services that are used in Aus JDM Parts is only Amazon aws S3 Bucket service. This is used to allow for image uploading on the website which is mainly used for listings.



## Project Models

### Listings Model

- Listings model is a ApplicationRecord
- A listings belongs to a user
- A listing belongs to a category
- A listing has many images attached

### Users Model

- Users model is a ApplicationRecord
- A user has many listings that are destroyable dependant
- A user after created gets their role set to default
- A user belongs to a role

### Role Model

- Role model is a ApplicationRecord
- A role has many users

### Category Model

- A Category has many listings



## Database Relations

The database relations that are implemented in Aus JDM Parts are:

- A foreign key between "active_storage_attachments" and "active_storage_blobs". The "blob_id" column is linked.
- A foreign key between "active_storage_variant_records" and  "active_storage_blobs". The "blob_id" column is linked.
- A foreign key between "listings" and "categories". The "category_id" column is linked to allow listings to have access to the categories on the app.
- A foreign key between "listings" and "users". The "user_id" column is linked to have listings belong to users.
- A foreign key between "users" and "roles". The "role_id" column is linked to allow users to have different roles to allow for different views on the website.



## Database Schema

```
create_table "active_storage_attachments", force: :cascade do |t|

  t.string "name", null: false

  t.string "record_type", null: false

  t.bigint "record_id", null: false

  t.bigint "blob_id", null: false

  t.datetime "created_at", null: false

  t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"

  t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true

 end



 create_table "active_storage_blobs", force: :cascade do |t|

  t.string "key", null: false

  t.string "filename", null: false

  t.string "content_type"

  t.text "metadata"

  t.string "service_name", null: false

  t.bigint "byte_size", null: false

  t.string "checksum", null: false

  t.datetime "created_at", null: false

  t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true

 end



 create_table "active_storage_variant_records", force: :cascade do |t|

  t.bigint "blob_id", null: false

  t.string "variation_digest", null: false

  t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true

 end



 create_table "categories", force: :cascade do |t|

  t.string "name"

  t.datetime "created_at", precision: 6, null: false

  t.datetime "updated_at", precision: 6, null: false

 end



 create_table "listings", force: :cascade do |t|

  t.string "name"

  t.text "description"

  t.integer "retail_price"

  t.string "vehicle_make"

  t.string "vehicle_model"

  t.datetime "created_at", precision: 6, null: false

  t.datetime "updated_at", precision: 6, null: false

  t.bigint "user_id", null: false

  t.string "brand"

  t.bigint "category_id"

  t.string "status", default: "active"

  t.integer "sales_count", default: 0, null: false

  t.string "strip_product_id"

  t.string "stripe_price_id"

  t.index ["category_id"], name: "index_listings_on_category_id"

  t.index ["user_id"], name: "index_listings_on_user_id"

 end



 create_table "pay_charges", id: :serial, force: :cascade do |t|

  t.string "owner_type"

  t.integer "owner_id"

  t.string "processor", null: false

  t.string "processor_id", null: false

  t.integer "amount", null: false

  t.integer "amount_refunded"

  t.string "card_type"

  t.string "card_last4"

  t.string "card_exp_month"

  t.string "card_exp_year"

  t.datetime "created_at"

  t.datetime "updated_at"

  t.jsonb "data"

  t.string "currency"

  t.integer "application_fee_amount"

  t.integer "pay_subscription_id"

 end



 create_table "pay_subscriptions", id: :serial, force: :cascade do |t|

  t.string "owner_type"

  t.integer "owner_id"

  t.string "name", null: false

  t.string "processor", null: false

  t.string "processor_id", null: false

  t.string "processor_plan", null: false

  t.integer "quantity", default: 1, null: false

  t.datetime "trial_ends_at"

  t.datetime "ends_at"

  t.datetime "created_at"

  t.datetime "updated_at"

  t.string "status"

  t.jsonb "data"

  t.decimal "application_fee_percent", precision: 8, scale: 2

 end



 create_table "roles", force: :cascade do |t|

  t.string "name"

  t.string "code"

  t.datetime "created_at", precision: 6, null: false

  t.datetime "updated_at", precision: 6, null: false

 end



 create_table "users", force: :cascade do |t|

  t.string "email", default: "", null: false

  t.string "encrypted_password", default: "", null: false

  t.string "reset_password_token"

  t.datetime "reset_password_sent_at"

  t.datetime "remember_created_at"

  t.datetime "created_at", precision: 6, null: false

  t.datetime "updated_at", precision: 6, null: false

  t.string "name"

  t.string "username"

  t.datetime "current_sign_in_at"

  t.datetime "last_sign_in_at"

  t.string "current_sign_in_ip"

  t.string "last_sign_in_ip"

  t.integer "sign_in_count"

  t.bigint "role_id"

  t.string "role"

  t.string "stripe_customer_id"

  t.index ["email"], name: "index_users_on_email", unique: true

  t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  t.index ["role_id"], name: "index_users_on_role_id"

 end



 add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"

 add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"

 add_foreign_key "listings", "categories"

 add_foreign_key "listings", "users"

 add_foreign_key "users", "roles"
```



## Trackable Tasks

The way tasks are trackable on Aus JDM Parts is through updating fields on the database depending on a certain task that is completed by the user. For example when the user logs into the app the "current_sign_in_at" and "last_sign_in_at" fields get automatically updated in the background to give more knowledge of what is going on for the admin when in the admin dashboard. Listings also get tracked by increasing the amount of sold items on a webhook from stripe comes through.

