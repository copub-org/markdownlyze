module Markdownlyze
  module Elements
    class Quote < ::Markdownlyze::Elements::Base
      def value
        @lines[@index..-1].each_with_index do |subline, subindex|
          if !subline.match?(/^\> .*/) && subline.to_s.strip != '>'
            @skip_until = @index + subindex
            break
          end
        end

        @skip_until = @lines.size if @skip_until.nil?

        @lines[@index..(@skip_until - 1)].map { |line| to_html(line.gsub(/^\> /, '')) }
      end
    end
  end
end
