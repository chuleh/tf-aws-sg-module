variable "rules" {
  description = "List of ports: from-port, to-port, protocol"

  default = {
    http-80-tcp   = [80, 80, "tcp", "HTTP"]
    https-443-tcp = [443, 443, "tcp", "HTTPS"]
  }
}
