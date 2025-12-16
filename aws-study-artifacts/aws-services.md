📦 Messaging & Queues
Amazon SQS → Simple Queue Service. Decouples apps with reliable, scalable message queues. Supports standard (at‑least‑once) and FIFO (exact order).

Amazon SNS → Simple Notification Service. Pub/sub messaging. Pushes notifications to multiple subscribers (email, SMS, Lambda, SQS).

⚙️ Containers & Compute
AWS Fargate → Serverless compute engine for containers. Runs ECS/EKS tasks without managing servers. Pay per vCPU/memory.

Amazon Lightsail → Simplified cloud hosting. Pre‑packaged VMs with networking, storage, and DNS. Good for small apps/websites.

Amazon ECS → Elastic Container Service. Orchestrates Docker containers. Integrates with Fargate or EC2.

Amazon EKS → Elastic Kubernetes Service. Managed Kubernetes clusters. Handles control plane, integrates with IAM/VPC.

Amazon ECR → Elastic Container Registry. Stores and manages Docker images. Secure, integrated with IAM.

🖥️ Core Compute
AWS Lambda → Serverless functions. Event‑driven, scales automatically. Pay per execution time.

Amazon EC2 → Elastic Compute Cloud. Virtual servers in the cloud. Flexible instance types, AMIs, scaling.

🌐 Networking & Load Balancing
Elastic Load Balancing (ELB) → Distributes traffic across EC2, containers, Lambda. Types: Application (HTTP/HTTPS), Network (TCP/UDP), Gateway.

Auto Scaling → Adjusts EC2/ASG capacity based on demand. Ensures performance and cost efficiency.

🚀 Application Deployment
Elastic Beanstalk → PaaS for deploying apps. Handles provisioning (EC2, ELB, Auto Scaling) automatically. Supports multiple languages.

AWS Batch → Runs batch computing jobs at scale. Dynamically provisions compute resources. Good for data processing pipelines.

AWS Outposts → Extends AWS infrastructure/services to on‑premises. Hybrid cloud solution with consistent APIs.

⚡ Tactical use
Practice explaining each in 90 seconds: what it is → why it matters → one use case.

Example: “SQS is a managed queue service. It decouples microservices by reliably storing messages until they’re processed. For instance, an e‑commerce app can queue orders before payment processing.”

---

📑 AWS Services Cheat Sheet
Service Definition Interview Use Case
Amazon SQS Managed message queues. Decouples apps with reliable, scalable messaging. Queueing orders in e‑commerce before payment processing.
Amazon SNS Pub/sub notifications. Pushes to multiple subscribers (email, SMS, Lambda, SQS). Broadcasting alerts to multiple systems when an event occurs.
AWS Fargate Serverless compute engine for containers. Runs ECS/EKS tasks without servers. Deploying microservices without managing EC2 instances.
Amazon Lightsail Simplified cloud hosting with pre‑packaged VMs. Hosting a small WordPress site or dev environment.
Amazon ECS Docker container orchestration. Running containerized workloads with tight AWS integration.
Amazon EKS Managed Kubernetes clusters. Running Kubernetes apps without managing control plane.
Amazon ECR Secure Docker image registry. Storing and versioning container images for ECS/EKS.
AWS Lambda Event‑driven serverless functions. Pay per execution. Processing S3 upload events automatically.
Amazon EC2 Virtual servers in the cloud. Flexible instance types. Hosting web apps or backend services.
Elastic Load Balancing (ELB) Distributes traffic across EC2, containers, Lambda. Scaling a web app with multiple EC2 instances.
Auto Scaling Adjusts EC2/ASG capacity based on demand. Handling traffic spikes automatically during sales events.
Elastic Beanstalk PaaS for app deployment. Automates infra provisioning. Deploying a Python/Django app quickly.
AWS Batch Runs batch computing jobs at scale. Large‑scale data processing or scientific simulations.
AWS Outposts Extends AWS infra/services to on‑premises. Hybrid workloads needing local latency but AWS APIs.

🌍 AWS Global Infrastructure
Regions → Geographically isolated areas (e.g., us‑east‑1).

Availability Zones (AZs) → Independent data centers within a region, designed for fault tolerance.

Edge Locations → Part of AWS’s CDN (CloudFront). Cache content closer to users for faster delivery.

🌐 AWS for the Edge
CloudFront → Content Delivery Network (CDN) using edge locations.

Global Accelerator → Improves performance by routing traffic through AWS’s global network.

Local Zones / Wavelength → Extend AWS closer to end‑users for low‑latency apps.

☁️ AWS Cloud
On‑demand, pay‑as‑you‑go infrastructure.

Shared responsibility model: AWS secures the cloud infra, customers secure their workloads.

📑 AWS CloudFormation
AWS’s native Infrastructure as Code (IaC).

Templates in YAML/JSON define resources.

Automates provisioning and updates.

🔒 Amazon VPC (Virtual Private Cloud)
Isolated virtual network in AWS.

You control IP ranges, subnets, route tables, gateways, security groups.

🧩 Network Subnets
Divide a VPC into smaller networks.

Public subnet → connected to internet via Internet Gateway.

Private subnet → internal resources, often behind NAT Gateway.

🔐 AWS Client VPN
Securely connects remote workforce to AWS or on‑premises.

Managed, scalable VPN solution.

🔐 AWS Site‑to‑Site VPN
Encrypted tunnel between on‑premises network and AWS VPC.

Uses IPsec.

🔗 AWS PrivateLink
Provides private connectivity between VPCs and AWS services.

Traffic stays on AWS network, not public internet.

⚡ AWS Direct Connect
Dedicated, private network connection from data center/office to AWS.

Lower latency, consistent performance vs. internet VPN.

🌐 Internet Gateway
Allows communication between VPC resources and the internet.

Must be attached to a VPC.

🔐 Virtual Private Gateway
VPN concentrator on AWS side of Site‑to‑Site VPN.

Connects VPC to on‑premises via encrypted tunnel.

🔀 AWS Transit Gateway
Central hub to connect multiple VPCs and on‑premises networks.

Simplifies complex networking architectures.

🔄 NAT Gateway (Network Address Translation)
Allows instances in private subnets to access the internet (e.g., for updates).

Prevents inbound connections from internet.

🚪 Amazon API Gateway
Fully managed service to create, publish, and secure APIs.

Supports REST, HTTP, WebSocket APIs.

Integrates with Lambda, EC2, backend services.

Feature: Security Groups | Network ACL
Scope: Instance level (attached to EC2 instances) | Subnet level (associated with subnets)
State: Stateful (remembers state) | Stateless (doesn't remember state)
Rule types: Only allow type rules | Both allow and deny type rules
Return Traffic: Return traffic is automatically allowed if inbound traffic is allowed | Return traffic must be implicitly allowed in both directions
Uses: Fine-grained control of traffic for individual EC2 instances | Broad control of traffic in and out of subnets

🔑 Subnet Basics
Definition → Logical division of a VPC’s IP range.

Types → Public (internet‑facing via IGW) vs. Private (internal, often behind NAT).

Limit → Up to 200 subnets per VPC.

Communication → All subnets in a VPC can talk by default through the VPC router.

Soundbite (≈15 sec): “Subnets divide a VPC into smaller networks. Public subnets connect to the internet, private subnets host internal resources. By default, they can talk to each other through the VPC router.”

⚡ Best Practice Setup (Production)
VPC CIDR: 10.0.0.0/16

AZ1: Public subnet (10.0.1.0/24) for NAT/Load Balancer + Private subnet (10.0.10.0/24) for EC2.

AZ2: Public subnet (10.0.2.0/24) + Private subnet (10.0.11.0/24) for redundancy.

Minimum: 4 subnets for HA (2 public, 2 private).

Soundbite (≈20 sec): “A production VPC usually has 4 subnets — public and private in two AZs. Public subnets host load balancers or NAT gateways, private subnets host EC2 or databases. This ensures redundancy and high availability.”

📈 Growth Patterns
Tiny project → 2 subnets (dev only).

Small startup → 4–6 subnets.

Medium company → 12–20 subnets.

Large enterprise → 50–100+.

Soundbite (≈15 sec): “As companies scale, subnet count grows — from 2 in dev setups to 100+ in large enterprises. Subnets are the basic building block for secure, scalable architectures.”

AWS Best Practice: Minimum Setup

Even for a simple app, AWS recommends:
text

VPC: 10.0.0.0/16
├── Public Subnet (AZ1): 10.0.1.0/24 ← For NAT Gateway/Load Balancer
├── Private Subnet (AZ1): 10.0.10.0/24 ← For EC2 instances
├── Public Subnet (AZ2): 10.0.2.0/24 ← For redundancy
└── Private Subnet (AZ2): 10.0.11.0/24 ← For redundancy
