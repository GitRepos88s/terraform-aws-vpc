locals {
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = "true"
    } 

    vpc_final_tags = merge(
        local.common_tags,
        {
        Name = "${var.project}-${var.environment}"
        },
        var.vpc_tags
    )

    igw_final_tags = merge(
        local.common_tags,
        {
        Name = "${var.project}-${var.environment}"
        },
        var.igw_tags
    )

    az_names = slice(data.aws_availability_zones.available.names, 0, 2)

    public_subnet_final_tags = merge(
        local.common_tags,
        #roboshop-dev-public-us-east-1a
        {
        Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
        },
        var.public_subnet_tags
    )

    
}
