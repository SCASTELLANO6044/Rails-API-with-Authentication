class ApplicationController < ActionController::API
    include JwToken

    before_action :authenticate_user

    private
        def authenticate_user
            header = request.header['Authorization']
            header = header.split(' ').last if header
            begin
                @decoded = JwToken.decode(header)
                @current_user = User.find(@decoded[:user_id])
            rescue ActiveRecord::RecordNotFound => e
                render json: { errors: e.message }, status: :unauthorized
            rescue JWT::DecodeError => e
                render json: { errors: e.message }, status: :unauthorized
            end
        end
end
