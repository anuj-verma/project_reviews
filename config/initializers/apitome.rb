API_CLIENT_VERSIONS = { web: [ :v1, :v2 ] }
Apitome.setup do |config|
  config.mount_at = nil
  config.root = nil
  config.doc_path = nil
  config.title = "Project Reviews API Documentation"
  config.layout = "apitome/application"
  config.code_theme = "default"
  config.css_override = nil
  config.js_override = nil
  config.readme = "../../../api.md"
  config.single_page = true
end
