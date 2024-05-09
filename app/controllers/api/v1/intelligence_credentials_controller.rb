# Api::V1::ApplicationController is in the starter repository and isn't
# needed for this package's unit tests, but our CI tests will try to load this
# class because eager loading is set to `true` when CI=true.
# We wrap this class in an `if` statement to circumvent this issue.
if defined?(Api::V1::ApplicationController)
  class Api::V1::IntelligenceCredentialsController < Api::V1::ApplicationController
    account_load_and_authorize_resource :intelligence_credential, through: :team, through_association: :intelligence_credentials

    # GET /api/v1/teams/:team_id/intelligence_credentials
    def index
    end

    # GET /api/v1/intelligence_credentials/:id
    def show
    end

    # POST /api/v1/teams/:team_id/intelligence_credentials
    def create
      if @intelligence_credential.save
        render :show, status: :created, location: [:api, :v1, @intelligence_credential]
      else
        render json: @intelligence_credential.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/v1/intelligence_credentials/:id
    def update
      if @intelligence_credential.update(intelligence_credential_params)
        render :show
      else
        render json: @intelligence_credential.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/intelligence_credentials/:id
    def destroy
      @intelligence_credential.destroy
    end

    private

    module StrongParameters
      # Only allow a list of trusted parameters through.
      def intelligence_credential_params
        strong_params = params.require(:intelligence_credential).permit(
          *permitted_fields,
          :api_key,
          :class_name,
          # 🚅 super scaffolding will insert new fields above this line.
          *permitted_arrays,
          # 🚅 super scaffolding will insert new arrays above this line.
        )

        process_params(strong_params)

        strong_params
      end
    end

    include StrongParameters
  end
else
  class Api::V1::IntelligenceCredentialsController
  end
end
