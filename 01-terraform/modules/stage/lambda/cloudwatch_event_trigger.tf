resource "aws_cloudwatch_event_rule" "trigger_lambda" {
  name = "${var.trigger_name}"
  schedule_expression = "${var.trigger_cron}"
  is_enabled = "${var.trigger_enabled}"
}

resource "aws_cloudwatch_event_target" "lambda_event_target" {
  rule = "${aws_cloudwatch_event_rule.trigger_lambda.name}"
  arn = "${var.lambda_arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_lambda" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.lambda_function.arn}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.trigger_lambda.arn}"
}
