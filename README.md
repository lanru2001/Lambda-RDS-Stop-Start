It’s best practice in Amazon Web Services (AWS) platform to have a Relational Database Service (RDS) instance running only during certain peak times and other times conveniently shut down. I wanted to use AWS Lambda using Python to be able to start and stop the RDS instance and want the DB Instance name parameterized as an environment variable. So when I move code from Dev to QA to Production I can change the DB name in the environment variable without having to change the code. I suppose one can use the same technique to start and stop different types of instances, like MySQL, MariaDB or PostgreSQL






![image](https://user-images.githubusercontent.com/59709429/138482148-56fa1930-8669-4a4b-9ef8-da3e049867f2.png)
