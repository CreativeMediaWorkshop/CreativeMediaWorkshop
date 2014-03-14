class MoSiteController < ApplicationController
  layout 'mo'

  before_action :set_mo_item, only: [:special, :category, :item]
  before_action :set_mo_items, only: [:index, :sc_index]

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

  private
  	def set_mo_item
      @mo_item = MoItem.find(params[:id])
    end

    def set_mo_items
      @mo_items = MoItem.all
    end
end
