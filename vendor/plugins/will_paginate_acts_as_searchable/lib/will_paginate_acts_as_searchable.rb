module WillPaginateActsAsSearchable
  module ClassMethods
    def paginate_by_fulltext_search(query, options={})
      WillPaginate::Collection.create(*wp_parse_options(options)) do |pager|
        #transform acts_as_searchable options to will_paginate options
        p_options = wp_parse_options(options)#page, per_page, total(=always nil)
        options[:limit]=p_options[1]
        options[:offset]=(p_options[0].to_i-1)*p_options[1]
        options.delete(:page)#acts_as cannot read this...
        options.delete(:per_page)#acts_as cannot read this...
        
        #find results
        pager.replace fulltext_search(query,options)

        #total items
        #replace sets total if it can calculate by them itself
        unless pager.total_entries
          count_options = {:count=>true,:limit=>0}
          count_options[:attributes] = options[:attributes] if options[:attributes]
          pager.total_entries = fulltext_search(query, count_options)
        end
      end
    end
  end
end