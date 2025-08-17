resource "cloudflare_record" "a_vercel" {
  name            = "vercel"
  proxied         = false
  ttl             = 1
  type            = "A"
  content         = "76.76.21.21"
  zone_id         = var.cloudflare_zone_id
  allow_overwrite = true
  comment         = ""
  tags            = []
}

resource "cloudflare_record" "cname_api_swarm" {
  name            = "api.swarm"
  proxied         = true
  ttl             = 1
  type            = "CNAME"
  content         = "ghs.googlehosted.com"
  zone_id         = var.cloudflare_zone_id
  allow_overwrite = true
  comment         = ""
  tags            = []
}

resource "cloudflare_record" "txt_google_verification" {
  name            = "@"
  ttl             = 3600
  type            = "TXT"
  content         = "\"google-site-verification=8h_m8FnpdFIiib8-EiTcK8zoRSbuXia0jWcXOXH8PFA\""
  zone_id         = var.cloudflare_zone_id
  allow_overwrite = true
  comment         = ""
  tags            = []
  proxied         = false
}