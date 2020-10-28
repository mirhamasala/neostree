module ApplicationHelper
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def url_without_protocol(url)
    # https://rubular.com/r/zR4jOfwu9KFR0u
    url.to_s[/(.+:\/\/)?(.+)/, 2]
  end
end
