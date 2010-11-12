class Deliverable < ActiveRecord::Base
  has_attached_file :deliverable,
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
    :path => "deliverable_submissions/Veracity/:id/:filename"

  
  validates_attachment_content_type :deliverable,
    :content_type => ["image/jpeg", "image/png"],
    :unless => "!photo.file?"

  validates_attachment_presence
  
end
