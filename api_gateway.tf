resource "aws_apigatewayv2_route" "api_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.api_integration.id}"

  # Defaulting to NONE as no authorizer is defined in the infrastructure graph.
  # For production, consider using JWT or AWS_IAM authorization.
  authorization_type = "NONE"
}
