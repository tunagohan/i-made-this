class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.where(delete_flag: 0)
  end

  def show
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: '投稿が完了しました' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: '削除されました' }
      format.json { head :no_content }
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params
      .fetch(:item, {})
      .permit(
        :title,
        :category_id,
        :user_id,
        :description,
        :image,
        :image_cache,
        :url
      )
  end
end
