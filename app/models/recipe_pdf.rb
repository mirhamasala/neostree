class RecipePdf
  def initialize(recipe, controller)
    @recipe = recipe
    @controller = controller
  end

  def to_pdf
    pdf = pdf_grover("#{model_name}_pdfs/show", :recipe)
    pdf >> pdf_grover("#{model_name}_pdfs/front_cover", :front_cover)

    pdf.to_pdf
  end

  def pdf_grover(template, page)
    html = html_absolute(template)

    result = Grover.new(html, { display_url: base_url,
                                format: 'A4',
                                margin: styles[page] }).to_pdf

    CombinePDF.parse(result)
  end

  def file_name
    "#{@recipe.title.parameterize(separator: '_')}.pdf"
  end

  private

  def model_name
    @recipe.model_name.param_key
  end

  def base_url
    @controller.request.base_url
  end

  def html_relative(template)
    @controller.render_to_string({ template: template,
                                   layout: "#{model_name}_pdf.html",
                                   locals: { recipe: @recipe } })
  end

  def html_absolute(html_relative)
    Grover::HTMLPreprocessor.process html_relative(html_relative), base_url, 'http'
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
