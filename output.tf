# output "azs" {
#   value = data.aws_availability_zones.available.names
# }

### perring###

output "vpc_id" {
  value = aws_vpc.main.id
}