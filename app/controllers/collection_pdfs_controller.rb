class CollectionPdfsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @collection = policy_scope(Collection).find(params[:collection_id])
    authorize @collection

    @recipes = recipes(current_user, @collection)

    respond_to do |format|
      format.pdf do
        base_url = 'https://neostree.com'

        html_absolute_front = get_html_absolute('recipe_pdfs/front_cover', base_url)
        pdf = CombinePDF.parse(get_pdf_grover(html_absolute_front, base_url, :front_cover))

        @collection.recipes.each do |recipe|
          html_absolute = get_html_absolute_collection('recipe_pdfs/show', base_url, recipe)
          pdf << CombinePDF.parse(get_pdf_grover(html_absolute, base_url, :recipe))
        end

        send_data pdf.to_pdf, type: 'application/pdf',
                              disposition: 'inline',
                              filename: "#{@collection.title.parameterize(separator: '_')}.pdf"
      end
    end
  end

  private

  def recipes(user, collection)
    if user&.admin? || user&.owner_of?(collection)
      collection.recipes
    else
      collection.recipes.status_published
    end
  end

  def get_html_relative(template)
    render_to_string({ template: template,
                       layout: 'recipe_pdf.html',
                       locals: { recipe: @collection.recipes.first } })
  end

  def get_html_absolute(html_relative, base_url)
    Grover::HTMLPreprocessor.process get_html_relative(html_relative), base_url, 'http'
  end

  def get_html_relative_collection(template, recipe)
    render_to_string({ template: template,
                       layout: 'recipe_pdf.html',
                       locals: { recipe: recipe } })
  end

  def get_html_absolute_collection(html_relative, base_url, recipe)
    Grover::HTMLPreprocessor.process get_html_relative_collection(html_relative, recipe), base_url, 'http'
  end

  def get_pdf_grover(html, base_url, page)
    styles = {
      recipe: {
        top: '0.75cm',
        right: '4cm',
        bottom: '1cm',
        left: '4cm'
      },
      front_cover: {
        top: '0.75cm',
        right: '2.5cm',
        bottom: '1cm',
        left: '2.5cm'
      }
    }

    Grover.new(html, { display_url: base_url,
                       format: 'A4',
                       margin: styles[page] }).to_pdf
  end
end
