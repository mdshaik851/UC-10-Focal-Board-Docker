# terraform_policies.rego
package terraform.policies

# Deny resources without tags
deny[msg] {
    resource := input.resource_changes[_]
    resource.type != "data"
    not resource.change.after.tags
    msg := sprintf("Resource '%s' of type '%s' must have tags", [resource.address, resource.type])
}

# Require encryption for S3 buckets
deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_s3_bucket"
    not resource.change.after.server_side_encryption_configuration
    msg := sprintf("S3 bucket '%s' must have server-side encryption enabled", [resource.address])
}