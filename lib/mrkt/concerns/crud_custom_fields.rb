module Mrkt
  module CrudCustomFields
    def create_custom_fields(fields)
      fields.map! do |field|
        {
          name: field,
          displayName: field,
          dataType: "string",
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
