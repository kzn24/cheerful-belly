class MainController < ApplicationController
  def index
    # 服用スケジュール表示用
    @active_schedules = current_user.schedules
                                    .where("start_date <= ? AND end_date >= ?", today, today)
                                    .includes(:drug, :supplement)

    @upcoming_schedules = current_user.schedules
                                      .where("start_date > ?", today)
                                      .includes(:drug, :supplement)

    schedules = current_user.schedules.includes(:drug, :supplement)

    # 今日から半月前〜半月後の日付範囲を生成
    date_range = ((Date.today - 15)..(Date.today + 15)).to_a

    # 記録カード用
    @records = current_user.records
               .where(record_date: date_range)
               .order(record_date: :asc)

    # 記録グラフ用
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

  def today
    Date.today
  end

  def schedules
    current_user.schedules.includes(:drug, :supplement)
  end
end
