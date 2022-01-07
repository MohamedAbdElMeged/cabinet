class Api::V1::DocumentsController < ApplicationController
    before_action :logged_in_user
    def create
        document = DocumentsHelper.create(@user,document_params)
        render "create",locals: {document: document}
    end
    def destroy
        document = DocumentsHelper.destroy(@user,params[:id])
        render json: "deleted successfully"
    end
    private
    def document_params
        params.permit(:file)
    end
end
