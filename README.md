![AWSTERRAFORMpng](https://github.com/user-attachments/assets/8eb1107d-c41c-4d24-b735-2c09fcccca06)

AWS Multi-Tier Infrastructure with Terraform
This project showcases a scalable and secure AWS architecture, designed using Terraform. It incorporates modern cloud practices like multi-tier deployment, automated resource management, and secure instance access using AWS Systems Manager (SSM). The design emphasizes high availability, efficient traffic distribution, and robust security without the need for traditional SSH-based connections.

Key Features of the Architecture
1. Networking Layer
VPC Foundation: A dedicated VPC serves as the foundation, divided into public and private subnets across multiple availability zones, ensuring high availability and fault tolerance.
Subnet Configurations:
Public Subnets: Handle internet-facing resources.
Private Subnets: Host internal services with no direct exposure to the internet.
2. Security Layer
Custom Security Groups: Each layer has specific security group configurations:
Proxy instances in public subnets.
Backend HTTP services in private subnets.
Load balancers managing traffic across tiers.
SSM Integration:
Eliminates the need for open SSH ports by enabling secure, portless access to EC2 instances.
Administrators connect via the AWS CLI or Management Console, using a secure URL for instance management.
3. Compute Layer
Proxy EC2 Instances:
Hosted in public subnets, running NGINX for traffic routing.
Configured to forward requests from the external load balancer to backend services.
Backend EC2 Instances:
Deployed in private subnets, running HTTP services to process requests.
4. Load Balancer Layer
Application Load Balancers (ALBs):
External ALB: Located in public subnets to manage incoming user traffic.
Internal ALB: Positioned in private subnets to distribute traffic among backend instances.
Health Checks: Ensure consistent availability of application components.
How It Works
User Requests:
Sent to the external ALB in public subnets.
Traffic Routing:
The external ALB forwards requests to proxy instances running NGINX.
Internal Load Balancing:
Proxy instances route requests to the internal ALB in private subnets.
Backend Processing:
The internal ALB distributes traffic to backend HTTP instances for processing.
Response Delivery:
Responses are sent back through the same route to the user.
Advantages of SSM Over SSH
Enhanced Security: Eliminates the need for SSH keys or open port 22 in security groups.
Simplified Management: Instances are securely accessed via AWS Session Manager.
Centralized Logging: Session activities are logged in CloudWatch for monitoring and auditing.
Prerequisites
Terraform Version: 0.12 or later.
AWS CLI: Configured with access credentials.
Permissions: Ability to create VPCs, subnets, load balancers, EC2 instances, and SSM resources.
Folder Structure
plaintext
Copy code
├── main.tf  
├── provider.tf  
└── modules/  
    ├── networking/  
    ├── security_groups/  
    ├── compute/  
    └── loadbalancer/  
Project Highlights
This project demonstrates a practical approach to building cloud-native infrastructure using Terraform. By leveraging SSM for instance access, it enhances security and manageability while maintaining modularity and scalability. The design is ideal for enterprises seeking efficient resource management and robust security practices.
