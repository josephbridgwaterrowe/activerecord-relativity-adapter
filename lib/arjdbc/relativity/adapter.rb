module ::ArJdbc
  module Relativity
  end
end

module ActiveRecord::ConnectionAdapters
  class RelativityAdapter < JdbcAdapter

    def self.arel2_visitors(config)
      require 'arel/visitors/compat'
      visitors = ::Arel::Visitors::ToSql
      { 'relativity' => visitors, 'jdbc' => visitors }
    end

    def jdbc_columns(table_name, name = nil)
      stmt = @connection.connection.createStatement
      query_result = stmt.executeQuery("SELECT * FROM #{table_name}")
      metadata = query_result.getMetaData
      columns = []

      #jdbc_to_ruby(metadata.getColumnType(i), rs.getObject(i))

      1.upto(metadata.getColumnCount) do |i|
        columns << ActiveRecord::ConnectionAdapters::Column.new(metadata.getColumnName(i), nil, metadata.getColumnType(i), true)
      end

      return columns
    end
    alias_chained_method :columns, :query_cache, :jdbc_columns
  end
end