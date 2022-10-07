module Mrkt
  module ExportLeads
    def create_job(fields: [], column_header_names: {}, start_at: nil, end_at: nil)
      post_json('/bulk/v1/leads/export/create.json') do
        params = {
          fields: fields,
          format: "CSV",
          columnHeaderNames: column_header_names,
          filter: {
            startAt: start_at,
            endAt: end_at
          }
        }

        merge_params(params, optional)
      end
    end

    def start_job(id)
      post("/bulk/v1/leads/export/#{id}/enqueue.json")
    end

    def check_job_status(id)
      get("/bulk/v1/leads/export/#{id}/status.json")
    end

    def retrieve_job_data(id)
      get("/bulk/v1/leads/export/#{id}/file.json")
    end

    def cancel_job(id)
      post("/bulk/v1/leads/export/#{id}/cancel.json")
    end
  end
end
