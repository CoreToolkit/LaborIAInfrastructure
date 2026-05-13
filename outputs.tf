output "backend_url" {
  description = "URL publica del backend"
  value       = "https://${var.backend_public_fqdn}"
}

output "frontend_url" {
  description = "URL publica del frontend"
  value       = var.frontend_public_url
}

output "backend_image_tag" {
  description = "Tag de imagen backend desplegada"
  value       = var.backend_image_tag
}

output "frontend_image_tag" {
  description = "Tag de imagen frontend desplegada"
  value       = var.frontend_image_tag
}
