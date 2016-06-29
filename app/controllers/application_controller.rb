require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do 
    
  end
  get '/posts/new' do 
    erb :new
  end 

  post '/posts' do 
    @post = Post.create(params)
    erb :show
  end

   

  get '/posts' do 
    @all = Post.all
    erb :index
  end 

  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show
  end 



  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end 
  
  post '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name=(params[:name])
    @post.content=(params[:content])
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.find(params[:id]).destroy
    erb :deleted
  end 
  


end