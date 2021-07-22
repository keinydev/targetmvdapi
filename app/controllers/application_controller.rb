class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken 

        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found 
        rescue_from ActiveRecord::RecordInvalid,  with: :render_record_invalid
        rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
        rescue_from ActionDispatch::Http::Parameters::ParseError, with: :render_parse_error        

        private

        def render_not_found(exception)
                render json: { error: "Not found" }, status: :not_found
        end

        def render_parameter_missing(exception)
                print(request)
                render json: { error: "Parameters are missing" }, status: :unprocessable_entity
        end

        def render_record_invalid(exception)
                render json: { errors: exception.record.errors.as_json }, status: :bad_request
        end

        def render_parse_error(exception)
                render json: { errors: "Error in json" }, status: :not_acceptable
        end
end
