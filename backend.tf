
 terraform {
     backend "s3" {
         bucket         = "myterraforms3bucket"
         key            = "terraform.tfstate"
         region         = "us-east-1"
         dynamodb_table = "mydynamoDBtable"
         encrypt        = true
     }
 }

