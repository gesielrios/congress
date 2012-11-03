class Admin::ContactsController < Admin::AdminController
  # GET /article_categories
  # GET /article_categories.json
  def index
    @contacts = Contact.paginate(:page => params[:page]).order('id')
  end

  # GET /article_categories/1
  # GET /article_categories/1.json
  def show
    @contact = Contact.find(params[:id])
  end

  # DELETE /article_categories/1
  # DELETE /article_categories/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to admin_contacts_url }
    end
  end
end