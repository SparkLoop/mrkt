module Mrkt
  module ExportLeads
    def create_export_job(fields: [], column_header_names: {}, start_at: nil, end_at: nil, optional_filters: {})
      post_json('/bulk/v1/leads/export/create.json') do
        filter_fields = {
          createdAt: {
            startAt: start_at,
            endAt: end_at
          }
        }

        params = {
          fields: fields,
          format: "CSV",
          columnHeaderNames: column_header_names,
          filter: filter_fields.merge(optional_filters)
          }
        }

        merge_params(params, {})
      end
    end

    def start_export_job(id)
      post("/bulk/v1/leads/export/#{id}/enqueue.json")
    end

    def check_export_job_status(id)
      get("/bulk/v1/leads/export/#{id}/status.json")
    end

    def retrieve_export_job_data(id)
      get("/bulk/v1/leads/export/#{id}/file.json")
    end

    def cancel_export_job(id)
      post("/bulk/v1/leads/export/#{id}/cancel.json")
    end
  end
end
