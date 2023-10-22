class AsasController < ApplicationController
      before_action :authenticate_user!
      def new
        @asa = Asa.new
      end
    
      def create
        @asa = Asa.new(asa_params)

        @asa.user_id = current_user.id
        
        if @asa.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def animal
        @asas = Asa.where(category:"動物")
      end
      
      def style
        @asas = Asa.where(category:"ファッション")
      end

      def music
        @asas = Asa.where(category:"音楽")
      end

      def trip
        @asas = Asa.where(category:"旅行")
      end

      def food
        @asas = Asa.where(category:"食べ物")
      end

      def anime
        @asas = Asa.where(category:"アニメ")
      end

      def movie
        @asas = Asa.where(category:"映画")
      end

      def sport
        @asas = Asa.where(category:"スポーツ")
      end

      def manga
        @asas = Asa.where(category:"漫画")
      end

      def study
        @asas = Asa.where(category:"勉強")
      end

      def business
        @asas = Asa.where(category:"ビジネス")
      end

      def tvshow
        @asas = Asa.where(category:"テレビ番組・ドラマ")
      end

      def celebrity
        @asas = Asa.where(category:"芸能人")
      end

      def event
        @asas = Asa.where(category:"イベント・お祭り")
      end

      def beauty
        @asas = Asa.where(category:"美容")
      end

      def meme
        @asas = Asa.where(category:"ミーム")
      end

      def game
        @asas = Asa.where(category:"ゲーム")
      end

      def others
        @asas = Asa.where(category:"その他")
      end
    
      def index
        @asas = Asa.order(created_at: :desc)
        search = params[:search]
        @asas = @asas.joins(:user).where("odai LIKE ? OR category LIKE ?", "%#{search}%", "%#{search}%") if search.present?
      end

      def show
        @asa = Asa.find(params[:id])
        @comments = @asa.comments
        @comment = Comment.new
      end

      def destroy
        asa = Asa.find(params[:id])
        asa.destroy
        redirect_to action: :index
      end

      private
      def asa_params
        params.require(:asa).permit(:image, :odai, :category)
      end
end