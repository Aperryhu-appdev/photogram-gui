class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photo_templates/index.html.erb"})
  end


  def show
    #Parameters: {"path_id" => "777"}
    url_id= params.fetch("path_id")

    matching_photo = Photo.where({:id => url_id})

    @the_photo = matching_photo.at(0)

    #if @the_user == nil
   #     redirect_to ("/404")
    
    render({:template => "photo_templates/show.html.erb"})
    #end

  end

  def del
     #Parameters: {"path_id" => "777"}
     the_id= params.fetch("path_id")

     matching_photo = Photo.where({:id => the_id})

     the_photo = matching_photo.at(0)

     the_photo.destroy
    #render({:template => "photo_templates/del.html.erb"})

    redirect_to("/photos")
  end

  def create
#Parameters:{"input_image"=>"https://media.pitchfork.com/photos/62bdd2cb9e0c39ec09d73fd7/1:1/w_320,c_limit/Beyonce-Renaissance.jpg", "input_caption"=>"COMFY.", "input_owner_id"=>"117", "controller"=>"photos", "action"=>"create"}

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch(  "input_owner_id")


    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save
    render({:template => "photo_templates/create.html.erb"})
  end
end
