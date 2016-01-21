class LoginsController < ApplicationController
    
    def new
        
    end
    
    def create
        user = User.find_by(email_korisnik: params[:email_korisnik])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Вие сте логирани"
            redirect_to groups_path
        else
            flash.now[:danger]= "Е-маилот и лозинката штo ги внесовте не се совпаѓаат"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "Вие не сте повеќе логирани"
        redirect_to root_path
    end
end