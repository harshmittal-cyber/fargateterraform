ecsclustername = "harsh-ecs-cluster"
tags={
    Name= "Harsh Mittal"
    Owner= "harsh.mittal@cloudeq.com"
    Purpose= "fargate with terraform"
}

sgname = "harshsg"
sgdesc = "harshecsvpc"
cidr_block = "10.0.0.0/16"
family="fargate-ecs"
network_mode = "awsvpc"
role_name = "harsh-execution-role"
policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
required_compatability = "FARGATE"