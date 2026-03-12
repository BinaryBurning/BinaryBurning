output "alb_dns_name" {
  description = "Public ALB DNS name"
  value       = module.compute.alb_dns_name
}
