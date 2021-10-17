class Api::EndpointSerializer
  include FastJsonapi::ObjectSerializer
  attributes *Endpoint.column_names
end
