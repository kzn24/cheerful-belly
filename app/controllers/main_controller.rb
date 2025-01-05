class MainController < ApplicationController
  def index
    # 今日から半月前〜半月後の日付範囲を生成
    date_range = ((Date.today - 15)..(Date.today + 15)).to_a

    # データを取得して範囲にマッピング
    @condition_rating_data = fill_missing_dates(
      Record.where.not(condition_rating: 0)
            .group_by_day(:record_date)
            .average(:condition_rating),
      date_range
    )

    @belly_rating_data = fill_missing_dates(
      Record.where.not(belly_rating: 0)
            .group_by_day(:record_date)
            .average(:belly_rating),
      date_range
    )

    @meal_rating_data = fill_missing_dates(
      Record.where.not(meal_rating: 0)
            .group_by_day(:record_date)
            .average(:meal_rating),
      date_range
    )

    @poop_rating_data = fill_missing_dates(
      Record.where.not(poop_rating: 0)
            .group_by_day(:record_date)
            .average(:poop_rating),
      date_range
    )
  end

  private

  # データを日付範囲にマッピングし、存在しない日付にはnilを設定
  def fill_missing_dates(data, date_range)
    data = data.transform_keys(&:to_date) # 日付キーをDate型に変換
    date_range.each_with_object({}) do |date, result|
      result[date] = data[date] || nil
    end
  end
end
