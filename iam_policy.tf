## Policy
resource "aws_iam_policy" "ses-policy" {
  name        = "app-developer-policy"
  description = "application developer policy"
  policy      = "${file("files/policy/app-developer-policy.json")}"
}
 