class RecipePdfsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @recipe = policy_scope(Recipe).find(params[:recipe_id])
    authorize @recipe

    respond_to do |format|
      format.pdf do
        base_url = 'http://localhost:3000/'
        html_relative = render_to_string({ template: 'recipe_pdfs/show',
                                            layout: 'recipe_pdf.html',
                                            locals: { recipe: @recipe } })

        html_relative_front = render_to_string({ template: 'recipe_pdfs/recipe_pdf_front_cover',
                                                  layout: 'recipe_pdf.html',
                                                  locals: { recipe: @recipe } })

        html_absolute = Grover::HTMLPreprocessor.process html_relative, base_url, 'http'

        html_absolute_front = Grover::HTMLPreprocessor.process html_relative_front, base_url, 'http'

        pdf_grover = Grover.new(html_absolute, { display_url: base_url,
                                          format: 'A4',
                                          margin: {
                                            top: '0.75cm',
                                            right: '4cm',
                                            bottom: '1cm',
                                            left: '4cm'
                                          } }).to_pdf

        pdf_grover_front = Grover.new(html_absolute_front, { display_url: base_url,
                                          format: 'A4',
                                          margin: {
                                            top: '0.75cm',
                                            right: '2.5cm',
                                            bottom: '1cm',
                                            left: '2.5  cm'
                                          } }).to_pdf

        pdf = CombinePDF.parse(pdf_grover)
        pdf >> CombinePDF.parse(pdf_grover_front)

        send_data pdf.to_pdf, type: 'application/pdf',
                              disposition: 'inline',
                              filename: "#{@recipe.title.parameterize(separator: '_')}.pdf"
      end
    end
  end
end
