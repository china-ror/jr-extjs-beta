# find
ActiveRecord::Base.class_eval do
   class << self
     VALID_FIND_OPTIONS << :params
     def find(*args,&block)
       options = args.extract_options!
       options.delete_if{|k,v| v.blank?}
       validate_find_options(options)
       set_readonly_option!(options)
       before_options!(options)
       if methods.include? 'before_find'
          before_find(self,args.first,options)
       end
       if not block.nil?
          block.call(self,args.first,options)
       end
       after_options!(options)
       res = nil
       case args.first
         when :first then res = find_initial(options)
         when :last  then res = find_last(options)
         when :all   then res = find_every(options)
         when :page  then res = paginate(options)
         else             
            res = find_from_ids(args, options)
       end
       if methods.include? 'after_find'
          after_find(self,args.first,options,res)
       end
       res
     end

     protected
     def paginate(options)
         count_options = options.clone
         count_options.delete :limit
         count_options.delete :offset
         count_options.delete :lock
         count_sql = nil
         if count_options[:group]
            count_sql = ('SELECT COUNT(*) AS c FROM (' << send(:construct_finder_sql,count_options) << ') AS count_tables')
         else
            count_options[:select] = "COUNT(#{quoted_table_name}.#{connection.quote_column_name(primary_key)}) AS c"
            count_sql = send(:construct_finder_sql,count_options)
         end
         count = find_by_sql(count_sql).first[:c].to_i
         offset = (options[:offset] || 0)
         limit = (options[:limit] || 30)
         page = (offset == 0 ? 1 : (offset.to_f/limit).ceil)
         res = []
         res = find_every(options) if offset < count
         {:data  => res,
          :offset=> offset,
          :limit => limit,
          :pages => (count.to_f/limit).ceil,
          :page  => page,
          :count => count}
     end


     def before_options!(options)
       options[:params] = (options[:params] || [])
       case options[:conditions]
       when Array then
            if options[:conditions].size > 1
               options[:params].concat(options[:conditions][1..-1])
               options[:conditions] = options[:conditions][0]
            end
       when Hash then
            options[:conditions] = merge_conditions(options[:conditions])
       else
       end
     end

     def after_options!(options)
         options[:conditions] = [options[:conditions]].concat(options[:params]) if options[:conditions]
     end

   end
end

