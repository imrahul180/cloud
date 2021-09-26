
Challenge 1 -> Type 2

Instance template -> Managed instance group -> Backend service -> Load balancer frontend IP

* This application type got load balancer in which it will receive traffic on frontend and then based of host and url map it will route the traffic to backend instance (Managed instance group)

* It can auto-scale based on the increased/decreased traffic

* It also got SSL cert to have the secure connection and it also got http redirect for http kind of traffic and then route to https based traffic.
