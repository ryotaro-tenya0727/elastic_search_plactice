config = {
  host: ENV['ELASTICSEARCH_HOST'] || "http://localhost:9200",
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)

begin
  Elasticsearch::Model.client.cluster.health
rescue Faraday::ConnectionFailed => e
  puts "Connection failed: #{e.message}"
rescue => e
  puts "An error occurred: #{e.message}"
end
