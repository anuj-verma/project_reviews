class ApitomeVersion
  def initialize(client, version)
    @path = "doc/api/#{client}/#{version}"
  end

  def matches?(request)
    # Load doc files from the right version folder
    Apitome.configuration.doc_path = @path
    # Mount all routes on the current request path (including simulated responses)
    Apitome.configuration.mount_at = request.path
    # Return a match
    true
  end
end
