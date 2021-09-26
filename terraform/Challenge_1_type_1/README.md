# Challenge 1 -> Type 1

Web tier -> App tier -> Database tier

List of resources which are there to create 3 tier web application
* VM instances (web,app,database)
* Firewall (web instance is only open to accept traffic from internet. web can traffic to app instance but not to database instance) (database instance can only talk to app instance and viceversa)
* Bucket to store the object data and can be used for various purpose based on business requirement.

you can restrict the vm access more granular using the IAM based on the requirement and scope
