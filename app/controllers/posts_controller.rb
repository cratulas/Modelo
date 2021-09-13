class PostsController < ApplicationController
    before_action :set_post, only: %i[edit update destroy ]
    def index
        @posts = Post.all
      end
    
      def new
        @post = Post.new
      end
      
      def create
        @post = Post.new(post_params)
        respond_to do |format|
          if @post.save
            format.js {render nothing: true, notice: 'Lo re creaste'}
          end
        end
      end
    
      def edit
        
      end
      
    
      def update
        
        respond_to do |format|
          if @post.update(post_params)
            format.js { render nothing: true, notice: "La buena actualizada" }
            format.json { render :show, status: :created, location: @post }
          end
        end
      end
      
      def destroy
        @post.destroy
        respond_to do |format|
          format.js { render nothing: true, notice: 'Esto nunca paso' }
        end
      end
    
      private

      def set_post
        @post = Post.find(params[:id])
      end
    
      def post_params
        params.require(:post).permit(:title, :content)
      end


end
