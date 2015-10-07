class RankingController < ApplicationController
  def want
    want_ranking = Want.group(:item_id).order("count_item_id desc").limit(10).count(:item_id)
    @ranking_table = Array.new

    ranking = 0
    temp_count = 0
    index = 0
    
    want_ranking.each do |item_id, count|
      item = Item.find(item_id)
      @ranking_table[index] = Hash.new
      
      if temp_count != count 
        ranking += 1
      end
      
      @ranking_table[index]["ranking"] = ranking
      
      @ranking_table[index]["title"] = item.title
      @ranking_table[index]["count"] = count
      temp_count = count

      @ranking_table[index]["url"] = item.detail_page_url
      index += 1
    end
  end

  def have
    have_ranking = Have.group(:item_id).order("count_item_id desc").limit(10).count(:item_id)
    @ranking_table = Array.new

    ranking = 0
    temp_count = 0
    index = 0
    
    have_ranking.each do |item_id, count|
      item = Item.find(item_id)
      @ranking_table[index] = Hash.new
      
      if temp_count != count 
        ranking += 1
      end
      
      @ranking_table[index]["ranking"] = ranking
      
      @ranking_table[index]["title"] = item.title
      @ranking_table[index]["count"] = count
      temp_count = count

      @ranking_table[index]["url"] = item.detail_page_url
      index += 1
    end
  end
end
