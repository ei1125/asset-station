require 'rails_helper'

describe Asset do
  describe '#create' do
    # 1, assetが存在すれば登録出来る
    it "is valid with a asset" do
      asset = build(:asset)
      expect(asset).to be_valid
    end

    # 2, assetが空では登録できないこと
    it "is invalid without a asset" do
      asset = build(:asset, item: nil)
      asset.valid?
      expect(asset.errors[:item]).to include("を入力してください")
    end

  end
end

# bundle exec rspec spec/models/asset_spec.rb