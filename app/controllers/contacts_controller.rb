class ContactsController < ApplicationController

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Contato enviado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
