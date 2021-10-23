
vpc_cidr = "10.0.0.0/16"

public_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]

azs = ["us-east-2a", "us-east-2b"]

lambda_runtime = "python3.6"

lambda_zip_path = 

lambda_function_name = "HttpServer"

lambda_handler = "run_lambda.http_server"

region = "us-east-2"

account_id
   
schedule_expression = "cron(5 * * * ? *)"
 
tag =

schedule_tag_force =
  
permissions_boundary =

exclude =

default =
 

time =
 

ec2_schedule =


rds_schedule =
 

security_group_ids =
 
subnet_ids =

resource_name_prefix =

