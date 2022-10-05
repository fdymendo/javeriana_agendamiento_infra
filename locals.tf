locals {
  name            = basename(path.cwd)
  region          = data.aws_region.current.name

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)
}
