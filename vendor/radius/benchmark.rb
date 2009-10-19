#!/usr/bin/env ruby
require 'benchmark'
require '../../config/environment'
require 'action_controller/test_process'

def render_content_with_page(tag_content, page)
  page.request = ActionController::TestRequest.new
  page.request.params[:sample_param] = 'data'
  page.request.request_uri = @request_uri || page.url
  page.request.host = @host || test_host
  ActionController::Base.relative_url_root = @relative_root
  page.response = ActionController::TestResponse.new
  if tag_content.nil?
    page.render
  else
    page.send(:parse, tag_content)
  end
end

def test_host
  "testhost.tld"
end

snippet = Snippet.find(:first)
input = <<EOD
<r:children:each by="title" order="asc">
  <r:unless_content part="no-map">
    <li>
      <r:link />
      <r:if_children>
        <ul>
          <r:snippet name="#{snippet.name}" />
        </ul>
      </r:if_children>
    </li>
  </r:unless_content>
</r:children:each>
EOD

page = Page.find(:first)

Benchmark.bm do|b|
  b.report("parse") do
    100.times { render_content_with_page(input, page) }
  end

end
