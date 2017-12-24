# Set format for Apitome See https://github.com/jejacks0n/apitome
RspecApiDocumentation.configure do |config|
  REQUEST_HEADERS = ['Accept', 'Content-Type', 'X-Api-Key']

  config.docs_dir = Rails.root.join("doc", "api")
  config.format = :json
  config.request_body_formatter = :json
  config.request_headers_to_include = REQUEST_HEADERS
  config.curl_headers_to_filter = ['Host', 'Cookie']
  config.curl_host = 'http://api.example.com'

  API_CLIENT_VERSIONS.keys.each do |client|
    API_CLIENT_VERSIONS[client].each do |version|
      config.define_group(version) do |group|
        group.filter  = (client.to_s + '_' + version.to_s).to_sym
        group.docs_dir = Rails.root.join('doc', 'api', client.to_s, version.to_s)
      end
    end
  end
end
