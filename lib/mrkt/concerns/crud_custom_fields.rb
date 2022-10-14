module Mrkt
  module CrudCustomFields
    def create_custom_fields(fields)
      # dataType can be one of the following:
      # ['boolean', 'currency', 'date', 'datetime', 'email', 'float', 'integer', 'percent', 'phone', 'score', 'string', 'url']
      fields.map! do |field|
        {
          name: field[:name],
          displayName: field[:name],
          dataType: field[:data_type].presence || "string",
          isCustom: true
        }
      end

      post_json("/rest/v1/leads/schema/fields.json") do
        { input: fields }
      end
    end

    def update_field(field_api_name, params)
      post_json("/rest/v1/leads/schema/fields/#{field_api_name}.json") do
        { input: [ params ] }
      end
    end
  end
end
