class ProducersController < ApplicationController 
  before_action :require_admin, only: [:edit, :update]
    
    def index
        @producers = Producer.all.paginate(page: params[:page], per_page: 6)
    end
    
    def new
      @producer = Producer.new
    end
    
    def create
        @producer = Producer.new(producer_params)
        if @producer.save
          flash[:success]="Производителот е успешно креиран."
          redirect_to producers_path
        else
          render :new
        end
    end
    
    def show
      @producer = Producer.find(params[:id])
      @medicaments = @producer.medicaments.all
    end
    
    def edit
        @producer=Producer.find(params[:id])
    end
    
    def update
        @producer=Producer.find(params[:id])
        if @producer.update(producer_params)
            flash[:success] = "Производителот е успешно изменет."
            redirect_to producers_path
        else
            render :edit
        end
    end
    
    def destroy
      @producer=Producer.find(params[:id])
      @producer.destroy
      flash[:success] = "Групата е избришана."
      redirect_to producers_path
    end
    
    private
      def producer_params
        params.require(:producer).permit(:ime_proizvoditel, :poteklo, :picture, :website)
      end
    
      def require_admin
        if current_user.admin != true
          flash[:danger] = "Промена може да направи само администратор"
          redirect_to producers_path
        end
      end
end