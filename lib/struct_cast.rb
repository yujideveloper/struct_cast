# frozen_string_literal: true

require "struct_cast/version"

module StructCast
  refine ::Kernel do
    def Struct(args)
      m =
        if args.respond_to? :to_hash
          :to_hash
        elsif args.respond_to? :to_h
          :to_h
        else
          raise ::TypeError, "can't convert #{args.class.name} to Hash"
        end

      hash =
        args.__send__(m).transform_keys do |k|
          raise ::ArgumentError, "invalid key type for #{__callee__}(): #{k.class.name}" unless k.respond_to? :to_sym
          k.to_sym
        end

      ::Struct.new(*hash.keys, keyword_init: true).new(**hash)
    end
  end
end
