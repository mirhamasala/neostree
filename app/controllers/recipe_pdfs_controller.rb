class RecipePdfsController < ApplicationController
  def show
    @recipe = policy_scope(Recipe).find(params[:recipe_id])
    authorize @recipe

    respond_to do |format|
      format.pdf do
        recipe_pdf = RecipePdf.new(@recipe, self)

        send_data recipe_pdf.to_pdf, type: 'application/pdf',
                                     disposition: 'inline',
                                     filename: recipe_pdf.file_name
      end
    end
  end
end
