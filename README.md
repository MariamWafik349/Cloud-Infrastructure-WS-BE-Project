AWS Multi-Tier Infrastructure with Terraform
This project showcases a scalable and secure AWS architecture designed using Terraform. It integrates modern cloud practices like multi-tier deployment, automated resource management, and secure instance access using AWS Systems Manager (SSM). The focus is on achieving high availability, efficient traffic distribution, and robust security without relying on traditional SSH-based connections.

Key Features of the Architecture
1. Networking Layer
A dedicated VPC serves as the foundation, divided into public and private subnets across multiple availability zones for high availability and fault tolerance.
Subnet configurations:
Public Subnets: Handle internet-facing resources.
Private Subnets: Host internal services with no direct exposure to the internet.
2. Security Layer
Custom security groups are defined for each layer:
Proxy instances in public subnets.
Backend HTTP services in private subnets.
Load balancers managing traffic across tiers.
SSM Integration:
Instead of opening SSH ports, SSM enables secure, portless access to EC2 instances.
Administrators connect using AWS CLI or Management Console, receiving a secure connection URL for direct management.
3. Compute Layer
Proxy EC2 Instances:
Hosted in public subnets, running NGINX for traffic routing.
Configured to forward requests from the external load balancer to backend services.
Backend EC2 Instances:
Deployed in private subnets, running HTTP services for processing requests.
4. Load Balancer Layer
Two Application Load Balancers (ALBs):
External ALB in public subnets manages incoming user traffic.
Internal ALB in private subnets distributes traffic among backend instances.
Health checks ensure consistent availability of application components.
How It Works
User requests are sent to the external load balancer in public subnets.
The external ALB forwards the requests to proxy instances running NGINX.
Proxy instances handle traffic management and route requests to the internal load balancer in private subnets.
The internal ALB distributes requests to backend HTTP instances for processing.
Processed responses are sent back through the same route to the user.
Advantages of SSM Over SSH
Enhanced Security: No need for SSH keys or open port 22 in security groups.
Simplified Management: Instances are accessed securely through AWS Session Manager.
Centralized Logging: Session activities are logged in CloudWatch for monitoring and auditing.
Prerequisites
Terraform version 0.12 or later.
AWS CLI configured with access credentials.
Permissions for creating VPCs, subnets, load balancers, EC2 instances, and SSM resources.
Folder Structure
css
Copy code
├── main.tf  
├── provider.tf  
└── modules/  
    ├── networking/  
    ├── security_groups/  
    ├── compute/  
    └── loadbalancer/  
Project Highlights
This project demonstrates a practical approach to building a cloud-native infrastructure using Terraform. By leveraging SSM for instance access, it ensures a more secure and manageable environment while maintaining modularity and scalability. This design is ideal for enterprises seeking efficient resource management and robust security practices.






