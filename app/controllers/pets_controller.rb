Skip to content

Search or jump to…

Pull requests
Issues
Marketplace
Explore
 @torianne02 Sign out
0
0 896 RickySauce/sinatra-complex-forms-associations-v-000
forked from learn-co-students/sinatra-complex-forms-associations-v-000
 Code  Pull requests 0  Projects 0  Insights
sinatra-complex-forms-associations-v-000/app/controllers/pets_controller.rb
a5603a6  9 days ago
@RickySauce RickySauce Done.
@SophieDeBenedetto @RickySauce

44 lines (35 sloc)  838 Bytes


class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    if !params["owner_name"].empty?
      @pet.owner_id = Owner.create(name: params["owner_name"]).id
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owner_id = Owner.create(name: params["owner"]["name"]).id
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end
