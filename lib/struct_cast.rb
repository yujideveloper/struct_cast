# frozen_string_literal: true

require "struct_cast/version"

module StructCast
  module CoreExt
    refine ::Object do
      def convert_to_hash
        if self.respond_to? :to_hash
          self.to_hash
        elsif self.respond_to? :to_h
          self.to_h
        else
          raise ::TypeError, "can't convert #{self.class.name} to Hash"
        end
      end
    end

    refine ::Hash do
      def symbolize_keys
        self.transform_keys do |k|
          raise ::TypeError, "can't convert key type to Symbol: #{k.class.name}" unless k.respond_to? :to_sym

          k.to_sym
        end
      end
    end
  end
  private_constant :CoreExt

  [::Kernel, ::Kernel.singleton_class].each do |klass|
    refine klass do
      using CoreExt

      def Struct(args)
        hash = args.convert_to_hash.symbolize_keys

        if hash.empty?
          ::Struct.new(nil, keyword_init: true).new
        else
          ::Struct.new(*hash.keys, keyword_init: true).new(**hash)
        end
      end
    end
  end
end
