# output "azs" {
#   value = data.aws_availability_zones.available.names
# }

### perring###

output "vpc_id" {
  value = aws_vpc.main.id
}


output "public_subnet_ids" {
  value = aws.public_subnet_ids[*].id
}

output "private_subnet_ids" {
  value = aws.private_subnet_ids[*].id
}

output "database_subnet_ids" {
  value = aws.database_subnet_ids[*].id
}

output "database_subnet_group_id" {
  value = aws_db_subnet_group.default.id
}

output "igw_id" {
  value = aws_internet_gateway.gw.id
}