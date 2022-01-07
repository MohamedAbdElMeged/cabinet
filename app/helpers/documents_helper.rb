module DocumentsHelper
    class << self
        def create(user,document_params)
            document = user.documents.build(document_params)
            document.save! ? document : document.errors
        end
        def destroy(user,id)
            user.documents.destroy_by(id: id)
        end
    end
end