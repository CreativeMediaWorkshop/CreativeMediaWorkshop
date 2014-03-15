class MoSiteController < ApplicationController
  layout 'mo'

  before_action :set_mo_item, only: [:special, :category, :item]
  before_action :set_mo_items, only: [:index, :sc_index, :tag_index, :explore]

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
    @tag_items = MoItem.tagged_with(params[:id])
  end

  def tag_index
    @tag_items = MoItem.tag_counts_on(:tags)
  end

  def explore
    @mo_items = @mo_items.page(params[:id])
  end

  private
    def set_mo_item
      @mo_item = MoItem.find(params[:id])
    end

    def set_mo_items
      @mo_items = MoItem.all
    end
end
