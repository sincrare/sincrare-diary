require 'csv'
class ArticleImagesController < ApplicationController
  def show
    article = Article.find(params[:article_id])
    if article.accesible?(current_user)
      # HerokuのDBレコードを10000件以下（Freeプラン範囲内)に抑えるため、過去の画像データはCSVファイルからパスを読み込む
      if article.id <= 4161
        article_image_records = CSV.read("config/article_images.csv", headers: true)
        article_image_records.each do |img|
          p img
          if img["article_id"] == params[:article_id] && img["image_id"] == params[:id]
            s3 = Aws::S3::Client.new(region: ENV['S3_REGION'], access_key_id: ENV['S3_ACCESS_KEY_ID'], secret_access_key: ENV['S3_SECRET_ACCESS_KEY'])
            signer = Aws::S3::Presigner.new(client: s3)
            data = open(signer.presigned_url(:get_object, bucket: ENV['S3_BUCKET'], key: "uploads/article_image/image/#{img['image_id']}/#{img['name']}"))
            send_data data.read, disposition: 'attachement'
            break
          end
        end

      else
        article_image = article.article_images.find(params[:id])
        data = open(article_image.image.url)
        send_data data.read, disposition: 'attachement'
      end
    else
      head :not_found
    end
  end
end
