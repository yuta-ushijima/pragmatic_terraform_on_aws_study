# # ポリシードキュメントの定義
# data "aws_iam_policy_document" "allow_describe_regions" {
#   statement {
#     effect = "Allow"
#     actions = ["ec2:DescribeRegions"]
#     resources = ["*"]
#   }
# }

# # IAMロールの定義
# data "aws_iam_policy_document" "ec2_assume_role" {
#   statement {
#     actions = ["sts:AssumeRole"]
#     principals {
#     type = "Service"
#     identifiers = ["ec2.amazonaws.com"]
#   }
#   }
# }

# # IAMポリシーのアタッチ
# resource "aws_iam_role_policy_attachment" "example" {
#   role = aws_iam_role.example.name
#   policy_arn = aws_iam_policy.example.arn
# }

# # IAMポリシー
# resource "aws_iam_policy" "example" {
#   name = "example"
#   policy = data.aws_iam_policy_document.allow_describe_regions.json
# }
