resource "cloudflare_record" "a_vercel" {
  name    = "vercel"
  proxied = false
  ttl     = 1
  type    = "A"
  content = "76.76.21.21"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "cname_api_swarm" {
  name    = "api.swarm"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  content = "swarm-api-872751579217.us-central1.run.app"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "txt_google_verification" {
  name = "@"
  ttl = 3600
  type = "TXT"
  content = "google-site-verification=8h_m8FnpdFIiib8-EiTcK8zoRSbuXia0jWcXOXH8PFA"
  zone_id = var.cloudflare_zone_id
}