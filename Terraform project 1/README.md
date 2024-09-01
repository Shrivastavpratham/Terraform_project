
# Terraform AWS Infrastructure Setup

This Terraform script is designed to provision an AWS infrastructure that includes a VPC, public subnets, internet gateway, route tables, security groups, EC2 instances, an Application Load Balancer (ALB), and an S3 bucket. The infrastructure is configured to host a web application across two availability zones with load balancing.

## Prerequisites

Before you begin, ensure that you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) v1.x or higher
- AWS CLI configured with appropriate credentials
- AWS account with the necessary permissions to create resources

## Variables

Make sure to define the following variables in a `terraform.tfvars` file or directly in the Terraform CLI:

\`\`\`hcl
cidr = "10.0.0.0/16"              # CIDR block for the VPC
subnet1cidr = "10.0.1.0/24"       # CIDR block for Subnet 1
subnet2cidr = "10.0.2.0/24"       # CIDR block for Subnet 2
\`\`\`

## Resources Created

The following AWS resources are created by this Terraform configuration:

1. **VPC (Virtual Private Cloud)**
    - A VPC with the specified CIDR block.

2. **Subnets**
    - Two public subnets, each in a different availability zone.

3. **Internet Gateway**
    - An internet gateway attached to the VPC.

4. **Route Table**
    - A route table with a route to the internet via the internet gateway, associated with both subnets.

5. **Security Group**
    - A security group allowing HTTP (port 80) and SSH (port 22) traffic from any IP.

6. **EC2 Instances**
    - Two EC2 instances, each in a different subnet, configured with user data scripts to set up the web servers.

7. **Application Load Balancer (ALB)**
    - An ALB that distributes HTTP traffic to the two EC2 instances.

8. **S3 Bucket**
    - An S3 bucket named `PrathamTerraformproject` for storing project-related data.

## Usage

1. **Initialize Terraform:**

   Run the following command to initialize the working directory containing the Terraform configuration files:

   \`\`\`bash
   terraform init
   \`\`\`

2. **Plan the Infrastructure:**

   Generate an execution plan to preview the changes that Terraform will apply:

   \`\`\`bash
   terraform plan
   \`\`\`

3. **Apply the Configuration:**

   Apply the changes required to reach the desired state of the configuration:

   \`\`\`bash
   terraform apply
   \`\`\`

   Confirm the apply with \`yes\` when prompted.

4. **Access the Load Balancer:**

   After the apply completes, Terraform will output the DNS name of the load balancer. You can access the web application using this DNS name in your web browser.

   \`\`\`bash
   terraform output loadbalancerdns
   \`\`\`

## User Data Scripts

The EC2 instances are configured using user data scripts (\`userdata.sh\` and \`userdata1.sh\`). These scripts should be placed in the same directory as your Terraform files. They are used to automatically configure the instances on launch, typically for installing and starting a web server.

## Cleaning Up

To destroy the infrastructure and avoid incurring charges, run:

\`\`\`bash
terraform destroy
\`\`\`

## Notes

- Ensure that the CIDR blocks for the VPC and subnets do not overlap with existing networks in your AWS environment.
- Modify the \`ami\` attribute in the EC2 instances to use a different Amazon Machine Image (AMI) if necessary.

## Troubleshooting

- **Subnet Overlap:** If you receive errors related to overlapping CIDR blocks, ensure that \`subnet1cidr\` and \`subnet2cidr\` are unique and within the range of the \`cidr\` block.
- **Permissions:** Ensure that the AWS credentials used have the necessary permissions to create all the listed resources.
