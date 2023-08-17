# frozen_string_literal: true

# name: discourse-send-pdf-inline
# about: serve all PDFs inline
# version: 0.1
# authors: Thomas Kalka (toka)
# url: https://github.com/thoka/discourse-send-pdf-inline

module SendPdfInline
  module UploadsControllerExtension
    def send_file( path,options={} )
      options[:disposition] = :inline if options.key?(:content_type) and options[:content_type]=="application/pdf"
      super(path,options)
    end
  end
end

after_initialize do
  ::UploadsController.prepend SendPdfInline::UploadsControllerExtension
end
