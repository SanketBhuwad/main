# this is your Terraform Snowflake provider
terraform {
    required_providers {
        snowflake = {
            source  = "Snowflake-Labs/snowflake"
            version = "0.39.0"
        }
    }
}
# connect to your Snowflake account
provider "snowflake" {
    account = "TA57286"
    region = "ap-south-1" # fill-in only if required
    username = "sanketbhuwad"
    password = "Sanket12345" # do not use, we'll set an env var instead
    role = "ACCOUNTADMIN"
}

resource "snowflake_table" "customer" {

 database = "MY_PROJECT"
 schema = "PUBLIC"
 name = "customer"

column {
    name = "Customer_ID"
    type = "varchar"
}
column {
    name = "Customer_Name"
    type = "varchar"
}
column {
    name = "Segment"
    type = "varchar"
}
column {
    name = "Country"
    type = "varchar"
}
column {
    name = "State"
    type = "varchar"
}
column {
    name = "Postal_code"
    type = "int"
}
column {
    name = "Region"
    type = "varchar"
}
}

resource "snowflake_table" "orders" {

 provider = snowflake
 database = "MY_PROJECT"
 schema = "PUBLIC"
 name = "orders"

column {
    name = "Order_ID"
    type = "varchar"
}
column {
    name = "Order_Date"
    type = "date"
}
column {
    name = "Ship_Date"
    type = "date"
}
column {
    name = "Ship_Mode"
    type = "varchar"
}
column {
    name = "Customer_ID"
    type = "varchar"
}
column {
    name = "Product_ID"
    type = "varchar"
}
column {
    name = "Sales"
    type = "float"
}
column {
    name = "Quantity"
    type = "int"
}
column {
    name = "Discount"
    type = "float"
}
column {
    name = "Profit"
    type = "float"
}
}

resource "snowflake_table" "product" {

 provider = snowflake
 database = "MY_PROJECT"
 schema = "PUBLIC"
 name = "product"

column {
    name = "Product_ID"
    type = "varchar"
}
column {
    name = "Category"
    type = "varchar"
}
column {
    name = "Sub_Category"
    type = "varchar"
}
column {
    name = "Product_Name"
    type = "varchar"
}
}



