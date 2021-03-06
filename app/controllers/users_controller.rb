class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update]
        
    def index
       @users = User.paginate(page: params[:page], per_page: 6) 
    end
    
    def show
       @user = User.find(params[:id]) 
    end
    
    def edit
       @user = User.find(params[:id]) 
    end
    
    def update
      @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:success]="Измената е извршена."
          redirect_to user_path(@user)
        else
          render :new
        end
    end
    
    def new
      @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success]="Профилот е успешно креиран. Можете да се најавите со Вашиот е-маил и Вашата лозинка"
          redirect_to root_path
        else
          render :new
        end
    end
    
    private
      def user_params
        params.require(:user).permit(:ime_korisnik, :prezime_korisnik, :email_korisnik, :profesija_korisnik, :admin, :password)
      end
      
      def require_same_user
          if current_user != @user && current_user.admin != true
            flash[:danger] = "Можете да го измените само Вашиот профил"
            redirect_to root_path
          end
        end
    
end