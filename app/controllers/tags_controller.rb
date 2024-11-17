class TagsController < ApplicationController
  def search
    # 一番最後のみ検索実行する
    keywords = params[:tag_name]
    keyword = keywords.split(",")[-1]
    tags = Tags.where('name LIKE(?)', "%#{keyword}%").pluck(:name)
    render json: { status: 'SUCCESS', message: 'Loaded tags', data: tags }
  end
end
