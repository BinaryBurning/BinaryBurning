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

Amazon Virtual Private Cloud - Amazon VPC is a service to provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define.

A subnet is a section of a VPC that can contain resources and is used to organize your resources. They can contain be either public or private.

An internet gateway is a connection between a VPC and the internet. It allows public traffic from the internet to access your VPC.

A virtual private gateway is the component that allows protected internet traffic to enter into the VPC. It allows a connection between your VPC and a private network only if it is coming from an approved network.

Amazon Client VPC is a networking service you can use to connect your remote workers and on-premises networks to the cloud. It is a fully managed, elastic VPN service that automatically scales up or down based on user demand.

AWS Site-to-Site VPN creates a secure connection between your data center or branch offices and your AWS Cloud resources.

AWS PrivateLink is a highly available, scalable technology that you can use to privately connect your VPC to services and resources as though they were in your VPC.

AWS Direct Connect is a service that provides a dedicated private connection between your data center and a VPC.

Network Access Control List A (network ACL) allows or denies specific inbound or outbound traffic at the subnet level using stateless packet filtering.

Security groups control the inbound and outbound traffic for a resource at the instance level using stateful packet filtering.

Domain Name System (DNS) translates human readable domain names to machine readable IP addresses (for example, 192.0.2.0).

Route 53 is a scalable and reliable DNS web service that helps developers and businesses route end users to internet applications, whether they’re hosted in AWS or elsewhere. It also supports domain registration, health checks, and advanced traffic routing policies.

CloudFront is a web service that speeds up distribution of your web content to your users through a worldwide network of data centers called edge locations. It securely delivers content with low latency and high transfer speeds.

Global Accelerator is a networking service that helps improve the availability and performance of applications for global users by routing traffic through the AWS global network. It helps improve application availability, performance, and security.

Amazon VPC Transit Gateways is a network transit hub used to interconnect VPCs and on-premises networks.

Network Address Translation (NAT) gateway allows instances in a private subnet to connect with services outside your VPC. External services can't initiate a connection with those instances.

The Amazon API Gateway is an AWS service for creating, publishing, maintaining, monitoring, and securing APIs at any scale. It handles all the tasks involved in accepting and processing up to hundreds of thousands of concurrent API calls.

📦 AWS Storage Services Notes
🔑 Core Services
Amazon S3 → Scalable object storage for web assets, backups, and static hosting.

Amazon EBS → Block‑level storage for EC2 instances and databases.

Amazon EFS → Managed shared file system, supports simultaneous access across instances.

🗂️ Amazon S3 Storage Classes
S3 Standard → High durability, frequent access.

S3 Standard‑IA → Lower cost, infrequent access, still multi‑AZ.

S3 One Zone‑IA → Cheaper, single AZ, infrequent access.

S3 Express One Zone → Ultra‑low latency, single AZ, high‑performance workloads.

S3 Glacier Instant Retrieval → Archival, millisecond retrieval.

S3 Glacier Flexible Retrieval → Archival, minutes to hours retrieval.

S3 Glacier Deep Archive → Lowest cost, retrieval in hours.

S3 Outposts → S3 storage on‑premises for hybrid workloads.

⚙️ S3 Management Features
S3 Lifecycles → Automates transitions between storage classes.

S3 Storage Class Analysis → Recommends optimal storage class usage.

S3 Intelligent‑Tiering → Automatically moves objects between tiers based on access patterns.

📂 File Systems
Amazon EFS → Elastic, scalable file storage for Linux workloads.

Amazon FSx for Windows File Server → Native Windows file system support.

Amazon FSx for NetApp ONTAP → Enterprise NAS features, snapshots, replication.

Amazon FSx for OpenZFS → ZFS‑based file system, snapshots, compression.

Amazon FSx for Lustre → High‑performance file system for HPC workloads.

🏠 Hybrid Storage (Storage Gateway)
S3 File Gateway → Local file interface backed by S3.

Volume Gateway → Block storage volumes backed by S3 snapshots.

Tape Gateway → Virtual tape library for backup apps.

🛡️ Backup & Recovery
EBS Snapshots → Point‑in‑time backups of EBS volumes.

Amazon Data Lifecycle Manager → Automates snapshot and AMI lifecycle management.

AWS Elastic Disaster Recovery → Replicates workloads for fast recovery during outages.

⚡ Soundbites
“Amazon S3 is scalable object storage, ideal for backups and static assets.”

“Amazon EBS provides block storage for EC2 and databases.”

“Amazon EFS offers shared file systems for workloads needing simultaneous access.”

Databases

🔄 Migration & Backup
AWS Database Migration Service (DMS) → Helps migrate databases to AWS with minimal downtime. Supports homogeneous (Oracle → Oracle) and heterogeneous (Oracle → PostgreSQL) migrations.

AWS Backup → Centralized backup service for AWS resources (EBS, RDS, DynamoDB, EFS, FSx). Automates backup policies and compliance.

🗄️ Relational Databases
Amazon RDS (Relational Database Service) → Managed relational database service. Supports engines like MySQL, PostgreSQL, MariaDB, Oracle, SQL Server. Handles backups, patching, scaling.

Amazon Aurora → High‑performance, MySQL/PostgreSQL‑compatible relational database. Designed for scalability and availability, up to 5x faster than standard MySQL.

⚡ In‑Memory & Caching
Amazon ElastiCache → Managed in‑memory caching service. Supports Redis and Memcached. Improves application performance by reducing database load.

Amazon DynamoDB Accelerator (DAX) → In‑memory cache for DynamoDB. Provides microsecond latency for read‑intensive workloads.

📑 NoSQL & Specialized Databases
Amazon DynamoDB → Fully managed NoSQL database. Key‑value and document store. Scales automatically, supports global tables, and integrates with DAX for caching.

Amazon DocumentDB → Managed document database compatible with MongoDB. Ideal for handling complex, semi‑structured data (JSON).

Amazon Neptune → Managed graph database. Optimized for relationships and graph queries. Use cases: social networks, fraud detection, recommendation engines.

🌐 Emerging Tech
Amazon Managed Blockchain → Fully managed service for creating and managing blockchain networks (Hyperledger Fabric, Ethereum). Enables decentralized applications and ledger systems.

⚡ Soundbites
“DMS migrates databases with minimal downtime.”

“RDS manages relational engines, while Aurora delivers high performance and scalability.”

“ElastiCache + DAX provide in‑memory acceleration for apps and DynamoDB.”

“DynamoDB is a serverless NoSQL store; DocumentDB handles complex JSON; Neptune powers graph queries.”

“Managed Blockchain supports decentralized applications.”

“AWS Backup centralizes and automates backups across services.”

Mod 8 here!!!

1. Artificial Intelligence (AI)
   AI is the broad field of building computer systems capable of performing humanlike tasks such as reasoning, perception, and decision-making.

2. Machine Learning (ML)
   ML is a subset of AI where systems learn patterns from historical data rather than being explicitly programmed.

ML training → finds patterns in data → produces an ML model

ML model → applied to new data → makes predictions or decisions

Common ML Business Use Cases
Predictive analytics (e.g., stock trends)

Decision automation (e.g., call routing)

Anomaly detection (e.g., fraud detection)

Recommendation systems (e.g., Amazon.com product recommendations)

✅ 3. AWS AI/ML Stack (3 Tiers)
Tier 1 — AI Services (Pre-built Models)
Ready-to-use APIs for common AI tasks. No ML expertise required.

Language & Text Services
Amazon Comprehend — NLP for key phrases, sentiment, entities

Amazon Transcribe — Speech → text

Amazon Polly — Text → lifelike speech

Amazon Translate — Real-time or batch text translation

Amazon Kendra — Intelligent enterprise search

Amazon Textract — Extracts typed/handwritten text, forms, tables

Amazon Lex — Conversational interfaces (chatbots, voicebots)

Vision Services
Amazon Rekognition — Image/video analysis (objects, faces, scenes)

Personalization
Amazon Personalize — Personalized recommendations using historical data

Tier 2 — ML Services (Custom ML with SageMaker)
Amazon SageMaker AI provides a fully managed environment to:

Build, train, and deploy ML models

Track experiments

Visualize and prepare data

Debug and monitor ML workflows

Deploy pre-trained models with minimal setup

Tier 3 — ML Frameworks & Infrastructure (Fully Custom ML)
For organizations needing full control over training and architecture.

ML Frameworks
PyTorch

TensorFlow

Apache MXNet

AWS ML Infrastructure
Amazon EC2 ML-optimized instances

Amazon EMR for distributed data processing

Amazon ECS for containerized ML workloads

✅ 4. Deep Learning (DL)
A subset of ML using neural networks with many layers. Each layer transforms information and passes it forward until the model learns complex patterns.

✅ 5. Generative AI & Foundation Models (FMs)
Foundation Models (FMs)
Extremely large deep learning models

Pre-trained on massive datasets

Adaptable to many tasks (unlike traditional single-task ML models)

Large Language Models (LLMs)
A type of FM trained on human language. Can generate text, code, summaries, etc.

Other FM Capabilities
Image generation

Video generation

Music creation

Multimodal reasoning

✅ 6. Generative AI on AWS
Amazon SageMaker JumpStart
Hub of pre-trained FMs and ML solutions

Deployable with a few clicks

Great for rapid prototyping

Amazon Bedrock
Fully managed service for building with FMs

Access models from Amazon + leading AI companies

Supports fine-tuning with your own data

Amazon Q
Generative AI assistant for business and development

Integrates with company data and tools

✅ 7. Amazon Q Products
Amazon Q Business
Answers questions using company data

Automates workflows

Extracts insights

Securely connects to enterprise systems

Use cases: Information retrieval, workflow automation, knowledge extraction

Amazon Q Developer
AI coding assistant

Generates code blocks, functions, and recommendations

Supports C#, Java, JavaScript, Python, TypeScript

Integrates with major IDEs

✅ 8. Benefits of AWS Generative AI Solutions
Rapid ML model deployment — Use pre-trained models instantly

Custom fine-tuning — Adapt FMs to domain-specific data

Experimentation — Compare multiple models before committing

1. ETL & Data Pipelines
   ETL (Extract, Transform, Load)
   Extract data from multiple sources

Transform data into a consistent, usable format

Load data into a destination (warehouse, analytics platform)

Data Pipelines
Automated workflows that make ETL repeatable, scalable, and reliable

AWS provides integrated services to build end‑to‑end pipelines

2. Data Analytics
   Traditional analytics uses historical data to uncover insights.

Common Use Cases
Loan companies explaining lending decisions

Medical researchers analyzing clinical trials

Insurance companies validating risk models

✅ 3. Data Ingestion Services
Amazon Kinesis Data Streams
Real-time ingestion of massive data volumes

Serverless, auto-scaling, on-demand throughput

Amazon Kinesis Data Firehose
Near real-time ingestion

Fully managed, auto-scaling

Delivers data to S3, Redshift, OpenSearch, and analytics tools within seconds

✅ 4. Data Storage Services
Amazon S3 (Data Lake)
Object storage for unlimited structured/unstructured data

Fully elastic and durable

Ideal for data lakes

Amazon Redshift (Data Warehouse)
Columnar storage + massively parallel processing

Stores petabytes of structured/semi-structured data

Optimized for business intelligence workloads

✅ 5. Data Cataloging
AWS Glue Data Catalog
Central metadata repository

Improves data discovery and pipeline efficiency

Integrates with S3, Redshift, Athena, EMR, Glue ETL

✅ 6. Data Processing Services
AWS Glue
Fully managed ETL service

Simplifies data cleaning, transformation, and preparation

Uses Glue Data Catalog for metadata-driven transformations

Amazon EMR
Managed big data processing using Spark, Hadoop, Hive

Auto-provisions clusters and scales workloads

Ideal for large-scale distributed processing

✅ 7. Data Analysis & Visualization
Amazon Athena
Serverless SQL querying directly on S3 or external sources

Pay only per query

Works with relational, non-relational, and custom data formats

Amazon Redshift (Analytics)
High-performance SQL analytics on large datasets

Ideal for frequent, complex analytical workloads

Amazon QuickSight
Serverless BI dashboards

Supports both technical and non-technical users

Amazon Q in QuickSight enables natural language querying

Amazon OpenSearch Service
Search and analytics engine

Real-time dashboards for logs, metrics, traces

🔐 AWS Security & Management Services Notes
🛡️ Protection & Defense
AWS Shield → Managed DDoS protection.

Standard: automatic protection for all AWS customers.

Advanced: extra detection, mitigation, and cost protection.

AWS WAF (Web Application Firewall) → Filters HTTP traffic, blocks common exploits (SQL injection, XSS).

Amazon GuardDuty → Threat detection using logs (VPC Flow, CloudTrail, DNS). Identifies compromised accounts/resources.

Amazon Inspector → Automated vulnerability management for EC2, ECR, Lambda. Scans for CVEs, misconfigurations.

Amazon Detective → Investigates suspicious activity, visualizes relationships between resources, users, and events.

🔑 Data Security & Compliance
AWS KMS (Key Management Service) → Centralized key creation, rotation, and encryption for AWS services.

Amazon Macie → ML‑powered sensitive data discovery (PII, financial data) in S3.

AWS Certificate Manager (ACM) → Manages SSL/TLS certificates for secure communication.

AWS Security Hub → Centralized security posture dashboard. Aggregates findings from GuardDuty, Inspector, Macie, etc.

👥 Identity & Access
AWS IAM (Identity and Access Management) → Core service for users, roles, policies.

AWS IAM Identity Center (formerly AWS SSO) → Centralized access management across AWS accounts and apps.

Multi‑Factor Authentication (MFA) → Extra layer of login security.

AWS Organizations → Multi‑account governance, consolidated billing, service control policies.

⚙️ Operations & Management
AWS Systems Manager → Unified operations hub.

Session Manager: secure shell access without opening ports.

Parameter Store: secure storage for config values and secrets.

Automation: runbooks for patching, updates.

AWS Config → Tracks resource configurations, compliance auditing.

AWS CloudTrail → Logs API calls and user activity for auditing.

Amazon CloudWatch → Metrics, alarms, dashboards for monitoring.

⚡ Soundbites
“Shield + WAF protect workloads from DDoS and web exploits.”

“GuardDuty, Inspector, Detective form the detection + investigation trio.”

“KMS, Macie, ACM secure data with encryption, discovery, and certificates.”

“IAM + Identity Center enforce least privilege and centralized access.”

“Systems Manager, Config, CloudTrail, CloudWatch keep operations secure and auditable.”

📊 Monitoring & Logging
Amazon CloudWatch → Collects metrics, logs, and events. Enables alarms, dashboards, and automated responses.

AWS CloudTrail → Records API calls and user activity across AWS accounts. Critical for auditing and security investigations.

📜 Compliance & Governance
AWS Artifact → On‑demand access to compliance reports, certifications, and agreements (SOC, ISO, PCI).

AWS Compliance Center → Central hub for compliance resources, regulations, and AWS compliance programs.

AWS Risk & Security Whitepaper → Foundational document outlining AWS’s shared responsibility model, risk management, and security practices.

AWS Audit Manager → Automates evidence collection for audits, helps demonstrate compliance with frameworks (e.g., GDPR, HIPAA).

AWS Config → Tracks resource configurations, evaluates compliance against rules, and provides change history.

🏢 Multi‑Account Management
AWS Organizations → Consolidated billing, multi‑account governance, service control policies (SCPs).

AWS Control Tower → Automates setup of secure multi‑account environments with guardrails and best practices.

📦 Service & Resource Management
AWS Service Catalog → Lets organizations create and manage approved service portfolios for consistent deployments.

AWS License Manager → Centralized license tracking and enforcement for software across AWS and on‑premises.

🩺 Health & Advisory
AWS Health Dashboard → Personalized view of AWS service health, outages, and maintenance events affecting your resources.

AWS Trusted Advisor → Real‑time recommendations across five categories:

Cost optimization

Performance

Security

Fault tolerance

Service limits

🔑 Identity & Access
AWS IAM Access Analyzer → Identifies resources (S3 buckets, IAM roles, KMS keys) shared outside your account. Helps enforce least privilege.

⚡ Soundbites
“CloudWatch + CloudTrail provide monitoring and auditing visibility.”

“Artifact, Compliance Center, Audit Manager, Config ensure compliance and governance.”

“Organizations + Control Tower manage multi‑account environments securely.”

“Service Catalog + License Manager standardize deployments and track licenses.”

“Health Dashboard + Trusted Advisor give proactive health and optimization insights.”

“IAM Access Analyzer enforces least privilege by detecting unintended resource sharing.”

!!!Not started
Module 11 - Pricing and Support
Not started
Module 12 - Migrating to the AWS Cloud

-

🏛️ AWS Well‑Architected Framework Pillars
Operational Excellence → Focuses on operations, monitoring, automation, and continuous improvement.

Security → Protects systems and data through least privilege, encryption, and data integrity.

Reliability → Emphasizes recovery planning, fault tolerance, and adaptability to demand changes.

Performance Efficiency → Encourages using the right resources and scaling as needs evolve.

Cost Optimization → Controls and reduces costs via smart provisioning and resource management.

Sustainability → Promotes energy‑efficient design and environmentally conscious resource usage.

👨‍💻 Developer Services
AWS CodeBuild → Fully managed build service; compiles source code, runs tests, produces artifacts.

AWS CodePipeline → Automates CI/CD pipelines; integrates CodeBuild, CodeDeploy, and third‑party tools.

AWS X‑Ray → Traces requests across distributed applications; helps debug microservices and performance bottlenecks.

AWS AppSync → Managed GraphQL service; simplifies data access across APIs, databases, and microservices.

AWS Amplify → Frontend + mobile app development platform, fullstack development; integrates hosting, authentication, APIs, and storage.

🏢 Business Services
Amazon Connect → Cloud contact center; enables customer service with voice, chat, and AI integration.

Amazon Simple Email Service (SES) → Scalable email sending service; supports transactional, marketing, and notification emails.

💻 End‑User Computing
Amazon AppStream 2.0 → Streams desktop applications securely to any device.

Amazon WorkSpaces → Managed virtual desktops in the cloud; supports Windows and Linux.

Amazon WorkSpaces Web → Secure browser‑based access to internal websites and SaaS apps.

🌐 IoT Services
AWS IoT Core → Connects IoT devices to AWS securely; supports MQTT, HTTP, and WebSockets.

IoT Analytics, IoT Greengrass, IoT Device Defender (important complements):

IoT Analytics: advanced data analysis for IoT device data.

IoT Greengrass: extends AWS services to edge devices.

IoT Device Defender: audits and monitors IoT configurations for security.

⚡ Soundbites
“The Well‑Architected Framework ensures workloads are secure, reliable, efficient, cost‑optimized, and sustainable.”

“CodeBuild + CodePipeline automate CI/CD, while X‑Ray and AppSync improve debugging and data access.”

“Amazon Connect and SES enable scalable customer communication.”

“AppStream 2.0 and WorkSpaces deliver secure end‑user computing.”

“IoT Core connects devices securely, with Greengrass and Device Defender extending functionality.”
