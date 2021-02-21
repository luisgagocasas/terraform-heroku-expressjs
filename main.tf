variable "domain" { type = string }
variable "heroku_email" { type = string }
variable "heroku_key" { type = string }

terraform {
  required_providers {
    heroku = {
      source = "heroku/heroku"
      version = "3.2.0"
    }
  }
}

provider "heroku" {
  email   = var.heroku_email
  api_key = var.heroku_key
}

resource "heroku_app" "this" {
  name   = var.domain
  region = "us"

  config_vars = {
    PORT = "80"
  }
}

resource "heroku_build" "this" {
  app = heroku_app.this.id
  source = {
    path = "./app"
  }
}

output "web_url" {
  value = [
    heroku_app.this.git_url,
    heroku_app.this.web_url,
    heroku_app.this.heroku_hostname,
    heroku_app.this.name
  ]
}