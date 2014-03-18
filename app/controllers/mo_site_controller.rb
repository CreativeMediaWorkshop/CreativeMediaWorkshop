class MoSiteController < ApplicationController
  layout 'mo'

  before_action :set_mo_item, only: [:special, :category, :item]
  before_action :set_mo_items, only: [:index, :sc_index, :tag_index]

  def index
  end

  def special
  end

  def category
  end

  def sc_index
  end

  def item
    @mo_item.hit
    #if @mo_item.type == "image"
  end

  def about
  end

  def tag
    @tag_items = MoItem.tagged_with(params[:id]).page(params[:page])
  end

  def tag_index
    @tag_items = MoItem.tag_counts_on(:tags)
  end

  def explore
    @mo_items = MoItem.order('id desc').page(params[:page])
  end

  def today
    @mo_items = MoItem.all.created_between(1.day.ago, Time.now).reverse
  end

  private
    def set_mo_item
      @mo_item = MoItem.find(params[:id])
    end

    def set_mo_items
      @mo_items = MoItem.all.reverse
    end

end
