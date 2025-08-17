module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "networking" {
  source = "./modules/networking"
  vpc_id = module.vpc.vpc_id
  cidr_subnet_1 = var.cidr_subnet_1
  cidr_subnet_2 = var.cidr_subnet_2
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_1 = module.networking.public_subnet_1
  subnet_2 = module.networking.public_subnet_2
}

module "nodegroup" {
  source = "./modules/nodegroup"
  cluster_name = module.eks.cluster_name
  node_group_name = var.node_group_name
  public_subnet_1 = module.networking.public_subnet_1
  public_subnet_2 = module.networking.public_subnet_2
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
  instance_type = var.instance_type
}

module "jenkins-server" {
  source = "./modules/jenkins-server"
  vpc_id = module.vpc.vpc_id
  ami = var.ami
  instance_type = var.instance_type
  subnet_1 = module.networking.public_subnet_1
  key_name = var.key_name
}
