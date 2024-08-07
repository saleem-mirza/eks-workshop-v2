output "environment_variables" {
  description = "Environment variables to be added to the IDE shell"
  value = {
    AIML_NEURON_ROLE_ARN    = module.iam_assumable_role_inference.iam_role_arn
    AIML_NEURON_BUCKET_NAME = resource.aws_s3_bucket.inference.id
    AIML_SUBNETS            = "${data.aws_subnets.private.ids[0]},${data.aws_subnets.private.ids[1]},${data.aws_subnets.private.ids[2]}"
    KARPENTER_NODE_ROLE     = module.eks_blueprints_addons.karpenter.node_iam_role_name
    KARPENTER_ARN           = module.eks_blueprints_addons.karpenter.node_iam_role_arn
  }
}