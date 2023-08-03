module Jekyll
    module LatestArticlesFilter
      def latest_articles(input, source)
        input.select { |item| item.data_source == source }.sort_by { |item| -item.date.to_f }.first
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::LatestArticlesFilter)
  