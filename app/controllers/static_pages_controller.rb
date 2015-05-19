class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def about
  end
  
  IMAGES_PATH = File.join(Rails.root, "public", "images")
  
  def report
  end
  def show_pdf
      #pdf_filename = File.join(Rails.root, "public/sample.pdf")
      #@model = pdf_filename
      send_file("#{Rails.root}/public/sample.pdf",        #pdf_filename, 
        :filename => "sample.pdf", 
        :disposition => 'inline', 
        :type => "application/pdf")
  end
  def download_pdf
    send_file("#{Rails.root}/public/sample.pdf",
      filename: "sample.pdf",
      type: "application/pdf"
    )
  end
  
end
