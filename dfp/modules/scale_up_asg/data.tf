data "aws_autoscaling_group" "bastion_dfp_asg" {
  name = "CCSDEV_bastion_cluster_scaling"
}

data "aws_autoscaling_group" "api_dfp_asg" {
  name = "CCSDEV_api_cluster_scaling"
}

data "aws_autoscaling_group" "app_dfp_asg" {
  name = "CCSDEV_app_cluster_scaling"
}
