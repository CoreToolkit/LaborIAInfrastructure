output "backend_url" {
  description = "URL publica del backend"
  value       = "https://${azurerm_container_app.backend.latest_revision_fqdn}"
}

output "frontend_url" {
  description = "URL publica del frontend"
  value       = "https://${azurerm_container_app.frontend.latest_revision_fqdn}"
}

output "backend_image_tag" {
  description = "Tag de imagen backend desplegada"
  value       = var.backend_image_tag
}

output "frontend_image_tag" {
  description = "Tag de imagen frontend desplegada"
  value       = var.frontend_image_tag
}
