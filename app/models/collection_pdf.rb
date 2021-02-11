class CollectionPdf
  def initialize(collection, controller)
    @collection = collection
    @controller = controller
  end

  def to_pdf
    pdf = pdf_grover('recipe_pdfs/front_cover', :front_cover, nil)

    @collection.recipes.each do |recipe|
      pdf << pdf_grover('recipe_pdfs/show', :recipe, recipe)
    end

    pdf.to_pdf
  end

  def pdf_grover(template, page, recipe)
    html = html_absolute(template, recipe)

    result = Grover.new(html, { display_url: base_url,
                                format: 'A4',
                                margin: styles[page] }).to_pdf

    CombinePDF.parse(result)
  end

  def file_name
    "#{@collection.title.parameterize(separator: '_')}.pdf"
  end

  private

  def base_url
    @controller.request.base_url
  end

  def html_relative(template, recipe)
    @controller.render_to_string({ template: template,
                                   layout: 'recipe_pdf.html',
                                   locals: { collection: @collection, recipe: recipe } })
  end

  def html_absolute(html_relative, recipe)
    Grover::HTMLPreprocessor.process html_relative(html_relative, recipe), base_url, 'http'
  end

  def styles
    {
      recipe: {
        top: '1.25cm',
        right: '2.25cm',
        bottom: '1.25cm',
        left: '2.25cm'
      },
      front_cover: {
        top: 0,
        right: 0,
        bottom: 0,
        left: 0
      }
    }
  end
end
