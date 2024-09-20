# config/initializers/elasticsearch.rb

Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: "http://localhost:9200",
  transport_options: {
    headers: {
      Authorization: "Basic #{Base64.strict_encode64('elastic:elasticsearch')}"
    }
  }
)
