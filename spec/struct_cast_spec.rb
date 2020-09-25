# frozen_string_literal: true

RSpec.describe StructCast do
  it "has a version number" do
    expect(StructCast::VERSION).not_to be nil
  end

  describe "Kernel#Struct" do
    context "when not using StructCast" do
      let!(:args) { { id: 1, name: "foo" } }

      it { expect { Struct(args) }.to raise_error ::NoMethodError }
    end

    context "when using StructCast" do
      using described_class

      subject { Struct(args) }

      context "when args is a hash for keys of symbol" do
        let!(:args) { { id: 1, name: "foo" } }

        it { is_expected.to be_a ::Struct }
        it { is_expected.to have_attributes(id: 1, name: "foo") }
      end

      context "when args is a hash for keys of string" do
        let!(:args) { { "id" => 1, "name" => "foo" } }

        it { is_expected.to be_a ::Struct }
        it { is_expected.to have_attributes(id: 1, name: "foo") }
      end

      context "when args is a hash for keys with mixture of string and symbol" do
        let!(:args) { { "id" => 1, :name => "foo" } }

        it { is_expected.to be_a ::Struct }
        it { is_expected.to have_attributes(id: 1, name: "foo") }
      end

      context "when args is a hash for keys containing a value that can't be converted to symbol" do
        let!(:args) { { 1 => "foo", :name => "bar" } }

        it { expect { subject }.to raise_error ::ArgumentError }
      end

      context "when args is a hash-like array" do
        let!(:args) { [[:id, 1], [:name, "foo"]] }

        it { is_expected.to be_a ::Struct }
        it { is_expected.to have_attributes(id: 1, name: "foo") }
      end

      context "when args is a hash-like object hat responds to :to_hash" do
        let!(:args) do
          c = Class.new do
            def initialize(id, name)
              @id = id
              @name = name
            end

            def to_hash
              { id: @id, name: @name }
            end
          end
          c.new(1, "foo")
        end

        it { is_expected.to be_a ::Struct }
        it { is_expected.to have_attributes(id: 1, name: "foo") }
      end

      context "when args is a hash-like object that responds to :to_h" do
        let!(:args) do
          c = Class.new do
            def initialize(id, name)
              @id = id
              @name = name
            end

            def to_h
              { id: @id, name: @name }
            end
          end
          c.new(1, "foo")
        end

        it { is_expected.to be_a ::Struct }
        it { is_expected.to have_attributes(id: 1, name: "foo") }
      end

      context "when args is a empty hash" do
        let!(:args) { {} }

        it { is_expected.to be_a ::Struct }
        it { is_expected.to satisfy { |struct| struct.members.empty? } }
      end

      context "when args is non-hash-like object that does not respond to :to_hash or :to_h" do
        let!(:args) do
          c = Class.new do
            def initialize(id, name)
              @id = id
              @name = name
            end
          end
        end

        it { expect { subject }.to raise_error ::TypeError }
      end
    end
  end
end
