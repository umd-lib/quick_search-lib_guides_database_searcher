# frozen_string_literal: true

require 'addressable/template'

module QuickSearch
  # QuickSearch searcher for LibGuides A-Z databases
  class LibGuidesDatabaseSearcher < QuickSearch::Searcher
    def search
      @response = JSON.parse(@http.get(query_url).body)
      data = @response['data']
      @total = data['count']
      html = Nokogiri::HTML(data['html'])

      # only save the first 3 nodes for extracting info
      @result_nodes = html.css('.s-lg-az-result')[0..2]
    end

    def results
      @results_list ||= @result_nodes.map do |node|
        title_node = node.at_css('.s-lg-az-result-title')
        OpenStruct.new(
          title: title_node.text.strip,
          link: title_node.at_css('a')['href'],
          description: node.at_css('.s-lg-az-result-description').text.strip,
          item_format: 'database'
        )
      end
    end

    def loaded_link
      # insert the current query into the first variable slot defined in the
      # loaded_link_template URI Template
      loaded_link_template.expand(loaded_link_template.names.first => @q).to_s
    end

    private

      def query_url
        # insert the current query into the first variable slot defined in the
        # query_template URI Template
        query_template.expand(query_template.names.first => @q).to_s
      end

      def query_template
        @query_template ||=
          Addressable::Template.new(QuickSearch::Engine::LIB_GUIDES_DATABASE_CONFIG['query_template'])
      end

      def loaded_link_template
        @url_template ||=
          Addressable::Template.new(QuickSearch::Engine::LIB_GUIDES_DATABASE_CONFIG['loaded_link_template'])
      end
  end
end
