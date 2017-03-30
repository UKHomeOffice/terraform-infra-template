resource "aws_iam_role" "lambda_iam_role" {
    name = "${var.lambda_role_name}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_instance_policy" {
    name = "${var.lambda_instance_policy_name}"
    role = "${aws_iam_role.lambda_iam_role.id}"
    policy = "${var.lambda_instance_policy_document}"
}

resource "aws_lambda_function" "lambda_function" {
    filename = "${var.lambda_payload_file}"
    function_name = "${var.lambda_function_name}"
    role = "${aws_iam_role.lambda_iam_role.arn}"
    handler = "${var.lambda_handler}"
    source_code_hash = "${base64sha256(file("${var.lambda_payload_file}"))}"
    runtime = "${var.lambda_runtime}"
    timeout = "${var.lambda_timeout}"
    memory_size = "${var.lambda_memory_size}"
}

output "lambda_function_arn" {
  value = "${aws_lambda_function.lambda_function.arn}"
}
