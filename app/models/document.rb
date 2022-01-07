class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :file, DocumentUploader
  before_create :set_title_of_document

  private
  def set_title_of_document
    self.title = self.file.identifier
  end
end
