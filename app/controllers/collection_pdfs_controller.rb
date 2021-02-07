class CollectionPdfsController < ApplicationController
  def show
    @collection = policy_scope(Collection).find(params[:collection_id])
    authorize @collection

    respond_to do |format|
      format.pdf do
        collection_pdf = CollectionPdf.new(@collection, self)

        send_data collection_pdf.to_pdf, type: 'application/pdf',
                                         disposition: 'inline',
                                         filename: collection_pdf.file_name
      end
    end
  end
end
